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
      print("pulled handle")
      slotMachine.updateColumns()
      resetSlotGridEntity(withColumns: slotMachine.columns)
      
      if slotMachine.didWin() {
        let winning = currentBet * 3
        resultDisplay.text = "YOU WIN \(winning)! YAY!!!"
        wallet += currentBet
      } else {
        resultDisplay.text = "YOU LOST \(currentBet)! BOO!!!"
        wallet -= currentBet
      }
    case .up:
      currentBet = currentBet + 1 <= wallet ? currentBet + 1 : currentBet
    case .down:
      currentBet = currentBet - 1 > 0 ? currentBet - 1 : currentBet
    }
  }
}
