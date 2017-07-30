//
//  UserDefaultsService.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 7/30/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import Foundation

class UserDefaultsService {
  // MARK: Lifecycle
  init(userDefaults: UserDefaults) {
    self.userDefaults = userDefaults
  }
  
  // MARK: Properties
  let userDefaults: UserDefaults
}

extension UserDefaultsService {
  func didReceiveInitialWalletCash() -> Bool {
    return userDefaults.bool(forKey: Keys.didReceiveInitialWalletCash)
  }
  
  func confirmReceiveInitialWalletCash() {
    userDefaults.set(true, forKey: Keys.didReceiveInitialWalletCash)
    userDefaults.synchronize()
  }
  
  func getPlayerWallet() -> Int {
    return userDefaults.integer(forKey: Keys.playerWallet)
  }
  
  func updatePlayerWallet(_ newValue: Int) {
    userDefaults.set(newValue, forKey: Keys.playerWallet)
    userDefaults.synchronize()
  }
}

extension UserDefaultsService {
  struct Keys {
    static let didReceiveInitialWalletCash = "didReceiveInitialWalletCash"
    static let playerWallet = "playerWallet"
  }
}
