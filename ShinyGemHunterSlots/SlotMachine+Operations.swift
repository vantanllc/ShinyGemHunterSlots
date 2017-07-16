//
//  SlotMachine+Operations.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 7/15/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

extension SlotMachine {
  func updateColumns() {
    columns.removeAll()

    for _ in stride(from: 0, to: 3, by: 1) {
      var column: [Gem] = []
      for _ in stride(from: 0, to: 3, by: 1) {
        column.append(Gem.getRandom(randomSource: sharedRandom))
      }

      columns.append(column)
    }
  }
}
