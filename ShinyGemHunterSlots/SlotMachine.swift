//
//  SlotMachine.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/6/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

enum Slot: String {
  case diamond, ruby
}

class SlotMachine {
  // MARK: Lifecycle
  init() {
    self.slots = []
  }
  
  // MARK: Properties
  var slots: [Slot]
}

extension SlotMachine {
  func updateSlots() {
    slots.removeAll()
    
    for _ in stride(from: 0, to: 3, by: 1) {
      if GKRandomSource.sharedRandom().nextBool() {
        slots.append(.diamond)
      } else {
        slots.append(.ruby)
      }
    }
  }
  
  func didWin() -> Bool {
    let uniqueSlots = Set<Slot>(slots)
    return uniqueSlots.count == 1
  }
}
