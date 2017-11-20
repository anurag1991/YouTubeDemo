//
//  VideoViewModel.swift
//  YouTubeDemo
//
//  Created by Anurag Yadav on 11/14/17.
//  Copyright © 2017 Anurag Yadav. All rights reserved.
//

import Foundation

protocol VideoViewModelDelegate {
  func didSuccess(video: [Videos])
  func didFailWith(error: Error)
}

class VideoViewModel: NSObject {
  static  let defualtModel =  VideoViewModel()
  var videosData: [Videos]?
  
   var delegate: VideoViewModelDelegate? =  nil
  
  func callYouTubeDataApi(urlString: String)  {
    NetworkManager.defaultNetworkManager.downloadDataWithURL(url: urlString) { (error, videos) in
      
      guard  (error == nil) else {
        self.delegate?.didFailWith(error: error!)
        return
      }
      self.videosData = videos
      self.delegate?.didSuccess(video: videos)
    }
  }
}
