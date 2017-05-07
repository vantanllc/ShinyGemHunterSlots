//
//  SlotMachine.spec.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 5/6/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

import Quick
import Nimble
@testable import ShinyGemHunterSlots

class SlotMachineSpec: QuickSpec {
  override func spec() {
    describe("SlotMachine") {
      var slotMachine: SlotMachine!
      let initialColumns: [[Gem]] = [
        [.diamond, .ruby, .amethyst],
        [.diamond, .ruby, .amethyst],
        [.diamond, .ruby, .amethyst]
      ]
      
      beforeEach {
        slotMachine = SlotMachine()
      }
      
      it("should have initialized columns of gems") {
        for (index, column) in slotMachine.columns.enumerated() {
          expect(column).to(equal(initialColumns[index]))
        }
      }
      
      context("updateColumns") {
        it("should set columns to new randomized columns of gems") {
          slotMachine.updateColumns()
          for (index, column) in slotMachine.columns.enumerated() {
            expect(column).toNot(equal(initialColumns[index]))
          }
        }
      }
      
      context("didWin") {
        it("should return true when gems in the middle row are the same") {
          expect(slotMachine.didWin()).to(beTrue())
        }
        
        it("should return false when gems in the middle row are not the same") {
          let loseColumns: [[Gem]] = [
            [.diamond, .ruby, .amethyst],
            [.diamond, .diamond, .amethyst],
            [.diamond, .ruby, .amethyst],
          ]
          
          slotMachine.columns = loseColumns
          
          expect(slotMachine.didWin()).to(beFalse())
        }
      }
    }
  }
}
