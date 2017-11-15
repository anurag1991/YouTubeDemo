//
//  NetworkManager.swift
//  YouTubeDemo
//
//  Created by Anurag Yadav on 11/14/17.
//  Copyright © 2017 Anurag Yadav. All rights reserved.
//

import Foundation

class NetworkManager: NSObject {
  
  static let defaultNetworkManager = NetworkManager()
  
  typealias CompletionHandler = (_ error: Error?, _ resources: [Videos]) -> Void
  

  func downloadDataWithURL(url: String, completion: @escaping CompletionHandler)  {
   
    URLSession.shared.dataTask(with: URL(string: url)!) { (data, reposne, error) in
      
     guard let data = data else{return}

      do{
        
        let video = try JSONDecoder().decode([Videos].self, from: data)
        completion(nil,video)
        
      }
      catch let jsonError {
         print("Error serlializing json",jsonError)
      }

    }.resume()
  }
}
