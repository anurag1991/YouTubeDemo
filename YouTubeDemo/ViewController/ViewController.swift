//
//  ViewController.swift
//  YouTubeDemo
//
//  Created by Anurag Yadav on 11/13/17.
//  Copyright © 2017 Anurag Yadav. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout{

  let menuBar: AYMenuBar = {
    let menuBar = AYMenuBar()
        menuBar.translatesAutoresizingMaskIntoConstraints = false
    return menuBar
  }()
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "Home"
    navigationController?.navigationBar.isTranslucent = false
    collectionView?.backgroundColor = UIColor.white
    
    setUpMenuBar()
    
    collectionView?.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: Constants.CellId.VideoCellId)
    collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellId.VideoCellId, for: indexPath)
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: self.view.frame.width, height: 200)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  // MARK: Private functions
  
  private func setUpMenuBar() {
    view.addSubview(menuBar)
    view.addConstraintsStringWithFormat(format: "H:|[v0]|", views: menuBar)
    view.addConstraintsStringWithFormat(format: "V:|[v0(50)]", views: menuBar)
  }
}









