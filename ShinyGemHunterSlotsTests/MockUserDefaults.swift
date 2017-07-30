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
    return keyValues.contains { key, value in
      return key == defaultName
    } ? keyValues[defaultName] as! Int : 0
  }
  
  override func set(_ value: Int, forKey defaultName: String) {
    keyValues[defaultName] = value
  }
  
  override func set(_ value: Bool, forKey defaultName: String) {
    keyValues[defaultName] = value
  }
  
  override func bool(forKey defaultName: String) -> Bool {
    return keyValues.contains { key, value in
      return key == defaultName
    } ? keyValues[defaultName] as! Bool : false
  }
  
  func clearKeyValues() {
    keyValues.removeAll()
  }
  
  let playerWallet: Int = 10
  let defaultValue: Int = 0
  var keyValues: [String: Any] = [:]
}
