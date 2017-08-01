//
//  AppDelegate.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/6/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import UIKit
import GoogleMobileAds

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    GADMobileAds.configure(withApplicationID: AdMob.appID)
    return true
  }
}

extension AppDelegate {
  func configureAdMob() {
    GADMobileAds.configure(withApplicationID: AdMob.appID)
  }
}
