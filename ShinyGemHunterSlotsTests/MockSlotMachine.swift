//
//  MockSlotMachine.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 7/3/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

@testable import ShinyGemHunterSlots

class MockSlotMachine: SlotMachine {
  var didWinReturn = true
  
  override func didWin() -> Bool {
    return didWinReturn
  }
}
