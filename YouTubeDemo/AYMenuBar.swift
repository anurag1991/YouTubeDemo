//
//  AYMenuBar.swift
//  YouTubeDemo
//
//  Created by Anurag Yadav on 11/14/17.
//  Copyright © 2017 Anurag Yadav. All rights reserved.
//

import UIKit

class AYMenuBar: UIView {
 
  let menuCollectionView: UICollectionView = {
      let collectionViewLayout = UICollectionViewFlowLayout()
      let menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
    return menuCollectionView
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)

    self.addSubview(menuCollectionView)
    setupConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Private function
  
  private func setupConstraints(){
    self.addConstraintsStringWithFormat(format: "H:|[v0]|", views: menuCollectionView)
    self.addConstraintsStringWithFormat(format: "V:|[v0]|", views: menuCollectionView)
    
  }
}
