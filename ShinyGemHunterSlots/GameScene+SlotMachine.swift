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
    let duration: TimeInterval = 0.1
    for columnEntity in columns {
      let deviation: TimeInterval = TimeInterval(GKRandomSource.sharedRandom().nextUniform() * 0.1)
      let columnDuration = duration + deviation
      let column = columnEntity.component(ofType: ColumnComponent.self)!
      column.rollSlots(duration: columnDuration)
      rollColumn(column: column, duration: columnDuration)
    }
  }
  
  func rollColumn(column: ColumnComponent, duration: TimeInterval) {
    let when = DispatchTime.now() + duration
    DispatchQueue.main.asyncAfter(deadline: when) {
      column.rollSlots(duration: duration)
      if duration <= 0.5 {
        let newDuration = duration + 0.01
        self.rollColumn(column: column, duration: newDuration)
      }
    }
  }
  
  func rollSlots(duration: TimeInterval) {
    let gridComponent = slotGridEntity?.component(ofType: GridComponent.self)
    let columns: [SlotColumnEntity] = gridComponent!.slotColumns.flatMap {$0}
    let when = DispatchTime.now() + duration
    DispatchQueue.main.asyncAfter(deadline: when) {
      for column in columns {
        let deviation: TimeInterval = TimeInterval(GKRandomSource.sharedRandom().nextUniform() * 0.5)
        column.component(ofType: ColumnComponent.self)?.rollSlots(duration: duration + deviation)
      }
      if duration <= 1 {
        let newDuration = duration + 0.1
        self.rollSlots(duration: newDuration)
      }
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
