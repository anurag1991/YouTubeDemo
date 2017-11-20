//
//  HomeController.swift
//  YouTubeDemo
//
//  Created by Anurag Yadav on 11/13/17.
//  Copyright © 2017 Anurag Yadav. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
  
  let settingLauncher = SettingsLaunchScreen()
  let titles = ["Home", "Trending", "Subscriptions", "Account"]
  
lazy var menuBar: AYMenuBar = {
    let menuBar = AYMenuBar()
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        menuBar.homeController = self
    return menuBar
  }()
  
  // MARK: Controller life cycle

  override func viewDidLoad() {
    super.viewDidLoad()
        
    navigationItem.title = "Home"
    navigationController?.navigationBar.isTranslucent = false
    
    setUpMenuBar()
    setUpNavBarButton()
    setupCollectionView()
  }
  func setupCollectionView() {
    collectionView?.backgroundColor = UIColor.white
    
    collectionView?.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier:Constants.CellId.VideoCellId )
    collectionView?.register(TrendingCollectionViewCell.self, forCellWithReuseIdentifier:Constants.CellId.TrendingCellId )
    
   collectionView?.register(SubscriptionCollectionViewCell.self, forCellWithReuseIdentifier:Constants.CellId.SubscriptionCellId )
    
    collectionView?.isPagingEnabled = true
    collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
  }
  
  // MARK: CollectionView
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let identifier: String?

    //******* Temp data ******//
    
    if indexPath.item == 1 {
      identifier = Constants.CellId.TrendingCellId
    } else if indexPath.item == 2 {
      identifier = Constants.CellId.SubscriptionCellId
    } else {
      identifier = Constants.CellId.VideoCellId
    }

    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier!, for: indexPath)
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: self.view.frame.height - 50)
  }
  
  // MARK: Private functions
  
  private func setUpMenuBar() {
    
    navigationController?.hidesBarsOnSwipe = true
    
    let redView = UIView()
    redView.backgroundColor = UIColor.customMenuBarColor
    view.addSubview(redView)
    view.addConstraintsStringWithFormat(format: "H:|[v0]|", views: redView)
    view.addConstraintsStringWithFormat(format: "V:[v0(50)]", views: redView)

    
    view.addSubview(menuBar)
    view.addConstraintsStringWithFormat(format: "H:|[v0]|", views: menuBar)
    view.addConstraintsStringWithFormat(format: "V:[v0(50)]", views: menuBar)
    menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
  }
  
  private func setUpNavBarButton() {
    let searchImage = #imageLiteral(resourceName: "search_icon").withRenderingMode(.alwaysOriginal)
    let searchBarButton = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(tapSearch))
    
    let moreImage = #imageLiteral(resourceName: "more_icon").withRenderingMode(.alwaysOriginal)
    let moreButton = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(handleMore))
    navigationItem.rightBarButtonItems = [moreButton,searchBarButton]
    
  }
  
  @objc private func tapSearch(){
    print("tapSearch")
  }
  
  lazy var settingsLauncher: SettingsLaunchScreen = {
    let launcher = SettingsLaunchScreen()
    launcher.homeController = self
    return launcher
  }()
  
 @objc func handleMore() {
    //show menu
    settingsLauncher.showSettings()
  }
  
  func showControllerForSetting(_ setting: Setting) {
    let dummySettingsViewController = UIViewController()
    dummySettingsViewController.view.backgroundColor = UIColor.white
    dummySettingsViewController.navigationItem.title = setting.name.rawValue
    navigationController?.navigationBar.tintColor = UIColor.white
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    navigationController?.pushViewController(dummySettingsViewController, animated: true)
  }
  
  func scrollToMenuIndex(_ menuIndex: Int) {
    let indexPath = IndexPath(item: menuIndex, section: 0)
    setTitleForIndex(menuIndex)

    collectionView?.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition(), animated: true)
  }
  
  fileprivate func setTitleForIndex(_ index: Int) {
    navigationItem.title = "  \(titles[index])"
  }
}

extension HomeController {
  override func scrollViewDidScroll(_ scrollView: UIScrollView) {
    menuBar.horizontalBarLeftAnchorConstraints?.constant = scrollView.contentOffset.x / 4
  }
  
  override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

    let selectedItem = Int(targetContentOffset.move().x / view.frame.width)
    
    setTitleForIndex(selectedItem)
    menuBar.menuCollectionView.selectItem(at: IndexPath(row: selectedItem, section: 0), animated: true, scrollPosition: .top )
  }
}




