//
//  GameViewController+GADInterstitialDelegate.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 7/31/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GoogleMobileAds

extension GameViewController: GADInterstitialDelegate {
  func interstitialDidDismissScreen(_ ad: GADInterstitial) {
    interstitial = AdBuilder.getInterstitial(withDelegate: self)
  }
  
  func interstitialWillDismissScreen(_ ad: GADInterstitial) {
    gameScene.didFinishViewingAds()
  }
}
