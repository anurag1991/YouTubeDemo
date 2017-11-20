//
//  AYMenuBar.swift
//  YouTubeDemo
//
//  Created by Anurag Yadav on 11/14/17.
//  Copyright © 2017 Anurag Yadav. All rights reserved.
//

import UIKit

class AYMenuBar: UIView {
  
  var horizontalBarLeftAnchorConstraints: NSLayoutConstraint?
  
  //***** Temp image array , size of the icons aren't good ***
  
  var homeController: HomeController?
  
  let imageArray: [String] = {
    return ["Home_1","trending_icon","Subscription-icon","Profile_icon"]
  }()
  
  
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
    setupHorizontalBar()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Private function
  
  private func setupConstraints(){
    self.addConstraintsStringWithFormat(format: Constants.AutoLayoutFormatString.MenuCellLayoutString.MenuCellHorizontalAxisFixed, views: menuCollectionView)
    self.addConstraintsStringWithFormat(format: Constants.AutoLayoutFormatString.MenuCellLayoutString.MenuCellVerticalAxisFixed, views: menuCollectionView)
  }
  
  private func setupHorizontalBar(){
    let horizontalBar = UIView()
    horizontalBar.backgroundColor = UIColor(white: 0.95, alpha: 1)
    horizontalBar.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(horizontalBar)
    
    //**** Set layout for horizontalbar
    horizontalBarLeftAnchorConstraints = horizontalBar.leftAnchor.constraint(equalTo: self.leftAnchor)
    horizontalBarLeftAnchorConstraints?.isActive = true
    
    horizontalBar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    horizontalBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
    horizontalBar.heightAnchor.constraint(equalToConstant: 8).isActive = true
    
  }
}

extension AYMenuBar: UICollectionViewDelegate,UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellId.MenuCellId, for: indexPath) as! MenuCollectionViewCell
        cell.imageView.image = UIImage(named: imageArray[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor.customStatusBarColor
    
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    homeController?.scrollToMenuIndex(indexPath.item)
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
