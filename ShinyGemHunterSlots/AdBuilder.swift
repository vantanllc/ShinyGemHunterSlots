//
//  AdBuilder.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 7/31/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GoogleMobileAds

class AdBuilder {
  static func getInterstitial(withDelegate delegate: GADInterstitialDelegate) -> GADInterstitial {
    let interstitial = GADInterstitial(adUnitID: AdMob.adUnitID)
    interstitial.delegate = delegate

    let request = GADRequest()
    request.testDevices = [kGADSimulatorID]
    interstitial.load(request)

    return interstitial
  }
  
  static func loadRewardAds(withUnitID adUnitID: String) {
    let request = GADRequest()
    request.testDevices = [kGADSimulatorID]
    GADRewardBasedVideoAd.sharedInstance().load(request, withAdUnitID: adUnitID)
  }
}
