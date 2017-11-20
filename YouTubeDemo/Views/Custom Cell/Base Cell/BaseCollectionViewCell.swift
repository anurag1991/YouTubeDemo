//
//  BaseCollectionViewCell.swift
//  YouTubeDemo
//
//  Created by Anurag Yadav on 11/14/17.
//  Copyright © 2017 Anurag Yadav. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUpViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setUpViews()  {
  }
}
