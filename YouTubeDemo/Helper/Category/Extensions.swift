//
//  Extensions.swift
//  YouTubeDemo
//
//  Created by Anurag Yadav on 11/13/17.
//  Copyright © 2017 Anurag Yadav. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  
  func addConstraintsStringWithFormat(format: String, views: UIView...) {
    
    var viewDictionary = [String: UIView]()
    for (index,view) in views.enumerated() {
      let key = "v\(index)"
      view.translatesAutoresizingMaskIntoConstraints = false
      viewDictionary[key] = view
    }
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewDictionary))
  }
}


extension UIColor {
  
 static let customStatusBarColor: UIColor = {
    return UIColor(red: 194/255, green: 32/255, blue: 31/255, alpha: 1)
  }()
  
 static let customMenuBarColor: UIColor = {
    return UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
  }()
}
