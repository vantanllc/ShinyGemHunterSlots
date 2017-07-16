//
//  SlotMachine.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/6/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

class SlotMachine {
  // MARK: Lifecycle
  init(columns: [[Gem]], randomSource: GKRandomSource) {
    sharedRandom = randomSource
    self.columns = columns
  }

  // MARK: Properties
  let sharedRandom: GKRandomSource
  var columns: [[Gem]]
}
