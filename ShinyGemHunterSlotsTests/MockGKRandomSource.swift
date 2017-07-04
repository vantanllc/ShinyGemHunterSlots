//
//  MockGKRandomSource.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 7/3/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

class MockGKRandomSource: GKRandomSource {
  override func nextInt(upperBound: Int) -> Int {
    return fixedInt
  }
  
  // MARK: Properties
  let fixedInt: Int = 1
}
