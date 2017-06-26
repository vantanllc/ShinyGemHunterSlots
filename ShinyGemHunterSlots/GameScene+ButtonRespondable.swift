//
//  GameScene+ButtonNode.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/6/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import SpriteKit

extension GameScene: ButtonRespondable {
  func buttonTriggered(button: ButtonNode) {
    guard let buttonIdentifier = button.buttonIdentifier else {
      return
    }
    
    switch buttonIdentifier {
    case .pullHandle:
      slotMachine.updateColumns()
      resetSlotGridEntity(withColumns: slotMachine.columns)
      evaluateSlotReel()
    case .up:
      if currentBet < wallet {
        currentBet += 1
      }
    case .down:
      if currentBet > 1 {
        currentBet -= 1
      }
    }
  }
}
