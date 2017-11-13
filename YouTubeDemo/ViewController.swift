//
//  ViewController.swift
//  YouTubeDemo
//
//  Created by Anurag Yadav on 11/13/17.
//  Copyright © 2017 Anurag Yadav. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout{

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "Home"
    collectionView?.backgroundColor = UIColor.white
    
    collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: self.view.frame.width, height: 200)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}








