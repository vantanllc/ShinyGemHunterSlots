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
  init() {
    self.columns = [[]]
  }
  
  // MARK: Properties
  var columns: [[Gem]]
}

extension SlotMachine {
  func updateColumns() {
    columns.removeAll()
    
    for _ in stride(from: 0, to: 3, by: 1) {
      var column: [Gem] = []
      for _ in stride(from: 0, to: 3, by: 1) {
        switch GKRandomSource.sharedRandom().nextInt(upperBound: 3) {
        case 0:
          column.append(.diamond)
        case 1:
          column.append(.ruby)
        default:
          column.append(.amethyst)
        }
      }
      
      columns.append(column)
    }
  }
  
  func didWin() -> Bool {
    let gems = columns.map { column in
      return column[1]
    }
    
    let uniqueSlots = Set<Gem>(gems)
    return uniqueSlots.count == 1
  }
}
