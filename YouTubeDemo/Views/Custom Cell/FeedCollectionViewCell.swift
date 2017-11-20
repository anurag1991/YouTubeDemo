//
//  FeedCollectionViewCell.swift
//  YouTubeDemo
//
//  Created by Anurag Yadav on 11/16/17.
//  Copyright © 2017 Anurag Yadav. All rights reserved.
//

import Foundation
import UIKit

class FeedCollectionViewCell: BaseCollectionViewCell {
  
  var videoArray = [Videos]()
  
 lazy var feedCollectionView: UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    let feedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    feedCollectionView.delegate = self
    feedCollectionView.dataSource = self
   return feedCollectionView
  }()
  
  override func setUpViews() {
    super.setUpViews()
    fetchData(urlString: Constants.URL.YouTubeDataBaseURL + Constants.URL.HomeFeedURL)
    addSubview(feedCollectionView)
    feedCollectionView.backgroundColor = UIColor.white

    addConstraintsStringWithFormat(format: "H:|[v0]|", views: feedCollectionView)
    addConstraintsStringWithFormat(format: "V:|[v0]|", views: feedCollectionView)
    
    feedCollectionView.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: Constants.CellId.VideoCellId)
  }
  
  // MARK: API
  
  func fetchData(urlString: String)  {
    VideoViewModel.defualtModel.callYouTubeDataApi(urlString: urlString)
    VideoViewModel.defualtModel.delegate = self
  }
}

extension FeedCollectionViewCell: UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return videoArray.count
    }
  
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
  
      let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellId.VideoCellId, for: indexPath) as! VideoCollectionViewCell
      cell.video = videoArray[indexPath.row]
      
      return cell
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
  
      //*** This caluclation based on resolution ratio of the screen and the image coming from the server -32 (we subtracted because we gave 16-16 margin from both side) and 9/16 is the ratio of the screen ***//
      let height = (self.frame.width - 32) * 9/16
  
      return CGSize(width: self.frame.width, height: height + 16 + 68)
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      
      return 0
    }
}

extension FeedCollectionViewCell: VideoViewModelDelegate {
  func didFailWith(error: Error) {
    print("error")
  }
  
  func didSuccess(video: [Videos]) {
    DispatchQueue.main.async {
      self.videoArray = video
      self.feedCollectionView.reloadData()
    }
  }
}
