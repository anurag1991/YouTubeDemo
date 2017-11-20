//
//  SubscriptionCollectionViewCell.swift
//  YouTubeDemo
//
//  Created by Anurag Yadav on 11/20/17.
//  Copyright © 2017 Anurag Yadav. All rights reserved.
//

import UIKit

class SubscriptionCollectionViewCell: FeedCollectionViewCell {
  override func fetchData(urlString: String) {
    super.fetchData(urlString: Constants.URL.YouTubeDataBaseURL + Constants.URL.SubscriptionsURL)
  }
}
