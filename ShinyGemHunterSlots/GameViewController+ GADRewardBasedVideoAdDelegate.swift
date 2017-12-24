//
//  GameViewController+ GADRewardBasedVideoAdDelegate.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 12/24/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GoogleMobileAds

extension GameViewController: GADRewardBasedVideoAdDelegate {
  func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                          didRewardUserWith reward: GADAdReward) {
    print("Reward received with currency: \(reward.type), amount \(reward.amount).")
    gameScene.didFinishViewingAds()
  }
  
  func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
    AdBuilder.loadRewardAds(withUnitID: AdMob.getMoreCoinsAdUnitId)
    print("Reward based video ad is closed.")
  }

  func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                          didFailToLoadWithError error: Error) {
    AdBuilder.loadRewardAds(withUnitID: AdMob.getMoreCoinsAdUnitId)
    print("Reward based video ad failed to load.")
  }
}
