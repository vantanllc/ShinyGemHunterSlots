//
//  SlotMachine.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/6/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

class SlotMachine {
  // MARK: Functions
  func didWin() -> Bool {
    let gems = columns.map { column in
      return column[1]
    }
    
    let uniqueSlots = Set<Gem>(gems)
    return uniqueSlots.count == 1
  }
  
  // MARK: Lifecycle
  init(randomSource: GKRandomSource) {
    sharedRandom = randomSource
    columns = [
      [.diamond, .ruby, .amethyst],
      [.diamond, .ruby, .amethyst],
      [.diamond, .ruby, .amethyst]
    ]
  }
  
  // MARK: Properties
  let sharedRandom: GKRandomSource
  var columns: [[Gem]]
}

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
