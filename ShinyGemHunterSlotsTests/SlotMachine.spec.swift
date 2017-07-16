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
      var mockSharedSource: MockGKRandomSource!
      
      let initialColumns: [[Gem]] = [
        [.diamond, .ruby, .amethyst],
        [.diamond, .ruby, .amethyst],
        [.diamond, .ruby, .amethyst]
      ]
      
      beforeEach {
        mockSharedSource = MockGKRandomSource()
        slotMachine = SlotMachine(columns: initialColumns, randomSource: mockSharedSource)
      }
      
      it("should have initialized columns of gems") {
        for (index, column) in slotMachine.columns.enumerated() {
          expect(column).to(equal(initialColumns[index]))
        }
      }
      
      context("updateColumns") {
        it("should set columns to new randomized columns of gems") {
          let expectedGem: Gem = Gem.getRandom(randomSource: mockSharedSource)
          slotMachine.updateColumns()
          _ = slotMachine.columns.flatMap{$0}.map{ gem in
            expect(gem).to(equal(expectedGem))
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
