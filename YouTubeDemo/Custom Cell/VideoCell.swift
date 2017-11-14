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
  
  let titleLabel: UILabel = {
    let label = UILabel()
        label.backgroundColor = UIColor.red
        label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let subtitleTextView: UITextView = {
    let subtitleTextView = UITextView()
    subtitleTextView.backgroundColor = UIColor.purple
    subtitleTextView.translatesAutoresizingMaskIntoConstraints = false
    return subtitleTextView
  }()
  
  let userProfileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "dsgidisgd.png")
    imageView.backgroundColor = UIColor.green
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
    addSubview(userProfileImageView)
    addSubview(titleLabel)
    addSubview(subtitleTextView)
    setUpLayoutConstraintForSubViews()
  }
  
  func setUpLayoutConstraintForSubViews() {
    //* Setting layout constraints for Sub Views
    
    addConstraintsStringWithFormat(format: "H:|-16-[v0]-16-|", views: imageView)
    addConstraintsStringWithFormat(format: "H:|-16-[v0(44)]", views: userProfileImageView)
    
    //* Vertical constraint
    addConstraintsStringWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: imageView,userProfileImageView,sepratorView)
    addConstraintsStringWithFormat(format: "H:|[v0]|", views: sepratorView)
    
    //*** Top anchor
    addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: imageView, attribute: .bottom, multiplier: 1, constant: 8))
    //** left anchor
    addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
   //** right anchor
    addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: imageView, attribute: .right, multiplier: 1, constant: 0))
    
    //** Height constraint
    addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
    
//*****  Sub title text view
    
    //*** Top anchor
    addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
    //** left anchor
    addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
    //** right anchor
    addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: imageView, attribute: .right, multiplier: 1, constant: 0))
    
    //** Height constraint
    addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))

  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
