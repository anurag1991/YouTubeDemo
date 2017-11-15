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
  
  // MARK: Controller life cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    
      VideoViewModel.viewModel.callYouTubeDataAPi()
      VideoViewModel.viewModel.delegate = self
    
    navigationItem.title = "Home"
    navigationController?.navigationBar.isTranslucent = false
    collectionView?.backgroundColor = UIColor.white
    
    collectionView?.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: Constants.CellId.VideoCellId)
    collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    
    setUpMenuBar()
    setUpNavBarButton()
  }
  
  // MARK: CollectionView
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return VideoViewModel.viewModel.videosData?.count ?? 0
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellId.VideoCellId, for: indexPath) as! VideoCollectionViewCell
    cell.video = VideoViewModel.viewModel.videosData?[indexPath.row]
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    //*** This caluclation based on resolution ratio of the screen and the image coming from the server -32 (we subtracted because we gave 16-16 margin from both side) and 9/16 is the ratio of the screen ***//
    let height = (view.frame.width - 32) * 9/16
    
    return CGSize(width: self.view.frame.width, height: height + 16 + 68)
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
  
  private func setUpNavBarButton() {
    let searchImage = #imageLiteral(resourceName: "search_icon").withRenderingMode(.alwaysOriginal)
    let searchBarButton = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(tapSearch))
    
    let moreImage = #imageLiteral(resourceName: "more_icon").withRenderingMode(.alwaysOriginal)
    let moreButton = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(tapMore))
    navigationItem.rightBarButtonItems = [moreButton,searchBarButton]
    
  }
  
  @objc private func tapSearch(){
    print("tapSearch")
  }
  
  @objc private func tapMore(){
    print("tapMore")
  }
}

extension HomeController: VideoViewModelDelegate {
  func didFailWith(error: Error) {
    print("error")
  }
  func didSuccess(video: [Videos]) {
    DispatchQueue.main.async {
      self.collectionView?.reloadData()
    }
  }
}


