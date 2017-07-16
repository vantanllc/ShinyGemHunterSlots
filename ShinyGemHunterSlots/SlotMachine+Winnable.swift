//
//  SlotMachine+Winnable.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 7/15/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

extension SlotMachine: Winnable {
  func didWin() -> Bool {
    let gems = columns.map { column in
      return column[1]
    }

    let uniqueSlots = Set<Gem>(gems)
    return uniqueSlots.count == 1
  }
}
