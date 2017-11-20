//
//  Constants.swift
//  YouTubeDemo
//
//  Created by Anurag Yadav on 11/14/17.
//  Copyright © 2017 Anurag Yadav. All rights reserved.
//

import Foundation

struct Constants {
  struct CellId {
   static let MenuCellId = "menuCellId"
   static let VideoCellId = "videoCellId"
   static let TrendingCellId = "trendingCellId"
   static let SubscriptionCellId  = "subscriptionsCellId"
  }
  
  struct AutoLayoutFormatString {
    struct MenuCellLayoutString {
      static let MenuCellHorizontalAxisFixed = "H:|[v0]|"
      static let MenuCellVerticalAxisFixed = "V:|[v0]|"
    }
    struct StatusBarLayoutString {
      static let StatusBarHorizontalAxisFixed = "H:|[v0]|"
      static let StatusBarVerticalAxisFixedWithWidth = "V:|[v0(20)]"
    }
  }
  
  struct URL {
    static let YouTubeDataBaseURL = "https://s3-us-west-2.amazonaws.com/youtubeassets"
    static let HomeFeedURL = "/home_num_likes.json"
    static let TrendingURL = "/trending.json"
    static let SubscriptionsURL = "/subscriptions.json"
  }
}
