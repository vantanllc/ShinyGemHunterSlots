//
//  MockUserDefaults.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 7/27/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import Foundation

class MockUserDefaults: UserDefaults {
  override func integer(forKey defaultName: String) -> Int {
    return defaultName == "playerWallet" ? playerWallet : defaultValue
  }
  
  let playerWallet = 10
  let defaultValue = 0
}
