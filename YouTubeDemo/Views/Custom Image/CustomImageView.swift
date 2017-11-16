//
//  CustomImageView.swift
//  YouTubeDemo
//
//  Created by Anurag Yadav on 11/15/17.
//  Copyright © 2017 Anurag Yadav. All rights reserved.
//

import Foundation
import UIKit

class CustomImageView: UIImageView {
  
  let imageCache = NSCache<NSString, UIImage>()
  var imageUrlString: String?
    
  func loadImageWithUrlString(urlString: String)  {
    
    imageUrlString = urlString
    
    if let imageFromCache = imageCache.object(forKey: urlString as NSString){
      self.image = imageFromCache
      return
    }
    
    URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
      if error != nil {
        return
      }
      
      DispatchQueue.main.async {
        let imageToCache = UIImage(data: data!)
        self.imageCache.setObject(imageToCache!, forKey: urlString as NSString)
        
        guard self.imageUrlString == urlString else {
         return
        }
          self.image = imageToCache
      }
    }.resume()
  }
}
