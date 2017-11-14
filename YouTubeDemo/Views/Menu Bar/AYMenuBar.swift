//
//  AYMenuBar.swift
//  YouTubeDemo
//
//  Created by Anurag Yadav on 11/14/17.
//  Copyright © 2017 Anurag Yadav. All rights reserved.
//

import UIKit

class AYMenuBar: UIView {
  
  lazy var menuCollectionView: UICollectionView = {
      let collectionViewLayout = UICollectionViewFlowLayout()
    let menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
          menuCollectionView.backgroundColor = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self

    return menuCollectionView
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    menuCollectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: Constants.CellId.MenuCellId)
    self.addSubview(menuCollectionView)
    
    //*** First cell selected when app launch **
    menuCollectionView.selectItem(at: NSIndexPath(row: 0, section: 0) as IndexPath, animated: false, scrollPosition:.top)
    setupConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Private function
  
  private func setupConstraints(){
    self.addConstraintsStringWithFormat(format: Constants.AutoLayoutFormatString.MenuCellLayoutString.MenuCellHorizontalAxisFixed, views: menuCollectionView)
    self.addConstraintsStringWithFormat(format: Constants.AutoLayoutFormatString.MenuCellLayoutString.MenuCellVerticalAxisFixed, views: menuCollectionView)
  }
}

extension AYMenuBar: UICollectionViewDelegate,UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellId.MenuCellId, for: indexPath)
    
    return cell
  }

}

extension AYMenuBar: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: frame.width / 4, height: frame.height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}





