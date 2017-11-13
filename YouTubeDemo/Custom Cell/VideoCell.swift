//
//  VideoCell.swift
//  YouTubeDemo
//
//  Created by Anurag Yadav on 11/13/17.
//  Copyright © 2017 Anurag Yadav. All rights reserved.
//

import Foundation
import UIKit

class VideoCell: UICollectionViewCell {
  // UI elements
  let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "dsgidisgd.png")
    imageView.backgroundColor = UIColor.blue
    return imageView
  }()
  
  let sepratorView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.black
    return view
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUpViews()
  }
  
  func setUpViews()  {
    addSubview(imageView)
    addSubview(sepratorView)
    setUpLayoutConstraintForSubViews()
  }
  
  func setUpLayoutConstraintForSubViews() {
    //* Setting layout constraints for Sub Views
    
    addConstraintsStringWithFormat(format: "H:|-16-[v0]-16-|", views: imageView)
    addConstraintsStringWithFormat(format: "V:|-16-[v0]-16-[v1(1)]|", views: imageView,sepratorView)
    addConstraintsStringWithFormat(format: "H:|[v0]|", views: sepratorView)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
