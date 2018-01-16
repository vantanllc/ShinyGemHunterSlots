//
//  GameScene+SlotMachine.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 7/15/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

extension GameScene {
  func animateColumns() {
    let gridComponent = slotGridEntity?.component(ofType: GridComponent.self)
    let columns: [SlotColumnEntity] = gridComponent!.slotColumns.flatMap {$0}
    for column in columns {
      column.component(ofType: ColumnComponent.self)?.rollSlots()
    }
  }
  
  func resetSlotGridEntity(withColumns columns: [[Gem]]) {
    slotGridEntity?.component(ofType: RenderComponent.self)?.node.removeFromParent()

    addSlotGrid()
  }

  func evaluateSlotReel() {
    if slotMachine.didWin() {
      let winnings = currentBet * Config.winningMultiplier
      wallet += winnings
      resultDisplay.text = "YOU WON \(winnings)! YAY!!!"
    } else {
      wallet -= currentBet
      resultDisplay.text = "YOU LOST \(currentBet)! BOO!!!"
    }
  }
}
