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
    
    setUpMenuBar()
    
    collectionView?.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: Constants.CellId.VideoCellId)
    collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
  }
  
  // MARK: CollectionView
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    print(VideoViewModel.viewModel.videosData?.count)
    return VideoViewModel.viewModel.videosData?.count ?? 0
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellId.VideoCellId, for: indexPath) as! VideoCollectionViewCell
    cell.video = VideoViewModel.viewModel.videosData?[indexPath.row]
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
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


