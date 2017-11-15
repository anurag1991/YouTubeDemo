//
//  Videos.swift
//  YouTubeDemo
//
//  Created by Anurag Yadav on 11/14/17.
//  Copyright © 2017 Anurag Yadav. All rights reserved.
//

import Foundation

struct Videos {
  var thumbnailImageName: String
  var videoTitle: String
  var numberOfViews: Int
  var channel: Channel
}

extension Videos: Decodable {
  
  private enum CodingKeys: String, CodingKey {
    case thumbnailImageName = "thumbnail_image_name", videoTitle = "title", numberOfViews = "number_of_views", channel = "channel"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    //***** Extracting Data here based on custom keys
    
    let thumbnailImageName: String = try container.decode(String.self, forKey: .thumbnailImageName)
    let videoTitle: String = try container.decode(String.self, forKey: .videoTitle)
    let numberOfViews: Int = try container.decode(Int.self, forKey: .numberOfViews)
    let channel: Channel = try container.decode(Channel.self, forKey: .channel)

    self.init(thumbnailImageName: thumbnailImageName, videoTitle: videoTitle, numberOfViews: numberOfViews,channel: channel)
  }
}

