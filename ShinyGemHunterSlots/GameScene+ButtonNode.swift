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
      slotMachine.updateSlots()
      slotsDisplay.text = slotMachine.slots.reduce("") {
        text, slot in
        return text + " " + slot.rawValue
      }
      
      if slotMachine.didWin() {
        resultDisplay.text = "YOU'RE A WINNER!!!"
      } else {
        resultDisplay.text = "YOU'RE A LOSER!!!"
      }
    default:
      break
    }
  }
}
