//
//  Channel.swift
//  YouTubeDemo
//
//  Created by Anurag Yadav on 11/15/17.
//  Copyright © 2017 Anurag Yadav. All rights reserved.
//

import Foundation

struct Channel {
  var name: String
  var profileImageName: String
}

extension Channel: Decodable {
  private enum CodingKeys: String, CodingKey {
    case profileImageName = "profile_image_name", name = "name"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
      let name: String =  try container.decode(String.self, forKey: .name)
    let profileImageName: String =  try container.decode(String.self, forKey: .profileImageName)
    self.init(name: name, profileImageName: profileImageName)
  }
}
