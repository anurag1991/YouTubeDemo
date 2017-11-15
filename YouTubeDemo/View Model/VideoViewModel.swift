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
  static  let viewModel =  VideoViewModel()
  var videosData: [Videos]?
  
   var delegate: VideoViewModelDelegate? =  nil
  
  
  //**** Filling temp. data ***** Please ignore this , this is just dummy data ****** //
  /*
  func fillDataInViewModel() {
  
    videos.append(Videos(thumbnailImageName: "eminem_1", videoTitle: "Eminem - Walk On Water (Audio) ft. Beyoncé", videoSubTitle: "EminemVEVO 19M views 2 week ago"))
    videos.append(Videos(thumbnailImageName: "eminem_2", videoTitle: "Eminem - Love The Way You Lie ft. Rihanna", videoSubTitle: "EminemVEVO 1.4B views 7 years ago"))
    videos.append(Videos(thumbnailImageName: "eminem_3", videoTitle: "Eminem - Not Afraid", videoSubTitle: "EminemVEVO 1B views 7 years ago"))
    videos.append(Videos(thumbnailImageName: "eminem_4", videoTitle: "Eminem - No Love (Explicit Version) ft. Lil Wayne", videoSubTitle: "EminemVEVO 337M views 7 years ago"))
    videos.append(Videos(thumbnailImageName: "eminem_5", videoTitle: "Bad Meets Evil - Fast Lane ft. Eminem, Royce Da 5'9", videoSubTitle: "BadMeetsEvilVEVO 103M views 6 years ago"))
  }
 */
  
  func callYouTubeDataAPi()  {
    NetworkManager.defaultNetworkManager.downloadDataWithURL(url: Constants.URL.YouTubeDataURL) { (error, videos) in
      
      guard  (error == nil) else {
        self.delegate?.didFailWith(error: error!)
        return
      }
      self.videosData = videos
      self.delegate?.didSuccess(video: videos)
    }
  }
}
