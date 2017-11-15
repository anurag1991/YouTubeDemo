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
   static let MenuCellId = "MenuCellId"
   static let VideoCellId = "VideoCellId"
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
    static let YouTubeDataURL = "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json"
  }
}
