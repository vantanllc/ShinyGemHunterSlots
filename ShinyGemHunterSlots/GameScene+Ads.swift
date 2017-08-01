//
//  GameScene+Ads.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 7/31/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import Foundation

extension GameScene {
  func didFinishViewingAds() {
    wallet += Config.watchAdsCredit
  }
}
