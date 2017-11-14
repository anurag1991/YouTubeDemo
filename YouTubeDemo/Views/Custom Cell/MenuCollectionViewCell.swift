//
//  MenuCollectionViewCell.swift
//  YouTubeDemo
//
//  Created by Anurag Yadav on 11/14/17.
//  Copyright © 2017 Anurag Yadav. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: BaseCollectionViewCell {

//**** for icon tint color we can add tint color here by using the tint color property of the imageview and use withRenderingInMode function and set it's value to .AlwaysTemplate and then we need to change where we overrodding this imageView like in cell for item at index path ****//
  
  var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "if_YOUTUBE_1217140")?.withRenderingMode(.alwaysTemplate)
    imageView.tintColor = UIColor.customStatusBarColor
    return imageView
  }()
  
  // **** Here i am overriding the highlighted and selected property of the cell ****//

  override var isHighlighted: Bool {
    didSet{
      self.imageView.tintColor = isHighlighted ? UIColor.white : UIColor.customStatusBarColor
    }
  }
  
  override var isSelected: Bool {
    didSet{
      self.imageView.tintColor = isSelected ? UIColor.white : UIColor.customStatusBarColor
    }
  }

  
  override func setUpViews() {
    super.setUpViews()
    addSubview(imageView)
    addConstraintsStringWithFormat(format: "H:[v0(28)]", views: imageView)
    addConstraintsStringWithFormat(format: "V:[v0(28)]", views: imageView)
    
    addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
    
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
  }
}
