//
//  VideoCollectionViewCell.swift
//  YouTubeDemo
//
//  Created by Anurag Yadav on 11/13/17.
//  Copyright © 2017 Anurag Yadav. All rights reserved.
//

import Foundation
import UIKit

class VideoCollectionViewCell: BaseCollectionViewCell {
  
  var video: Videos? {
    
    didSet {
     // imageView.image = UIImage(named: video?.thumbnailImageName ?? "")
     // titleLabel.text = video?.videoTitle
     // subtitleTextView.text = video?.videoSubTitle
    }
  }
  
  
  // UI elements
  let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    return imageView
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let subtitleTextView: UITextView = {
    let subtitleTextView = UITextView()
    subtitleTextView.textColor = UIColor.lightGray
    subtitleTextView.translatesAutoresizingMaskIntoConstraints = false
    subtitleTextView.isEditable = false
    subtitleTextView.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
    return subtitleTextView
  }()
  
  let userProfileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "profile_picture")
    return imageView
  }()
  
  let sepratorView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.black
    return view
  }()
  
  override func setUpViews()  {
    super.setUpViews()
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
    addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))

  }
}
