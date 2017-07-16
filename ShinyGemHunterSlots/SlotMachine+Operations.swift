//
//  SlotMachine+Operations.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 7/15/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

extension SlotMachine {
  func didWin() -> Bool {
    let gems = columns.map { column in
      return column[1]
    }
    
    let uniqueSlots = Set<Gem>(gems)
    return uniqueSlots.count == 1
  }
  
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
