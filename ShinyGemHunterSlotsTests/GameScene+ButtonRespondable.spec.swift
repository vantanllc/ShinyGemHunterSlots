//
//  GameScene+ButtonNode.spec.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 5/7/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

import Quick
import Nimble
@testable import ShinyGemHunterSlots

class GameSceneButtonRespondableSpec: QuickSpec {
  override func spec() {
    describe("GameScene+ButtonRespondable") {
      var scene: GameScene!
      var button: ButtonNode!
      let buttonFactory = ButtonFactory()
      var mockSharedSource: MockGKRandomSource!
      var mockUserDefaults: MockUserDefaults!
      
      beforeEach {
        mockSharedSource = MockGKRandomSource()
        mockUserDefaults = MockUserDefaults()
        let mockUserDefaultsService = UserDefaultsService(userDefaults: mockUserDefaults)
        scene = GameScene(size: CGSize(),
                          randomSource: mockSharedSource,
                          userDefaultsService: mockUserDefaultsService)
        scene.didMove(to: SKView())
      }
      
      context("buttonTriggered") {
        context("pullHandle button") {
          beforeEach {
            button = buttonFactory.createButton(withIdentifier: .pullHandle)
          }
          
          it("should update slotMachine columns with new randomized gems") {
            let expectedGem: Gem = Gem.getRandom(randomSource: mockSharedSource)
            scene.buttonTriggered(button: button)
            _ = scene.slotMachine.columns.flatMap{$0}.map{ gem in
              expect(gem).to(equal(expectedGem))
            }
          }
          
          it("should update resultDisplay label") {
            let previousText = scene.resultDisplay.text
            
            scene.buttonTriggered(button: button)
            
            expect(scene.resultDisplay.text).toNot(equal(previousText)) 
          }
          
          it("should update wallet") {
            let previousWallet = scene.wallet
            
            scene.buttonTriggered(button: button)
            
            expect(scene.wallet).toNot(equal(previousWallet))
          }
          
          context("slotGridEntity") {
            it("should create new slotGridEntity") {
              let previousSlotGridEntity = scene.slotGridEntity
              
              scene.buttonTriggered(button: button)
              
              expect(scene.slotGridEntity).toNot(be(previousSlotGridEntity))
            }
            
            it("should have new slotGridEntity node be in scene") {
              scene.buttonTriggered(button: button)
              
              let node = scene.slotGridEntity.component(ofType: RenderComponent.self)?.node
              expect(node?.parent).to(be(scene))
            }
            
            it("should set gem columns from slotMachine columns") {
              scene.buttonTriggered(button: button)
              
              let gridColumns = scene.slotGridEntity.component(ofType: GridComponent.self)!.gemColumns
              for (index, column) in gridColumns.enumerated() {
                expect(column).to(equal(scene.slotMachine.columns[index]))
              }
            }
          }
        }
        
        context("down button") {
          beforeEach {
            button = buttonFactory.createButton(withIdentifier: .down)
          }
          
          it("should decrement currentBet by 1 if currentBet is greater than 1") {
            let previousBet = 2
            scene.currentBet = previousBet
            
            scene.buttonTriggered(button: button)
            
            expect(scene.currentBet).to(equal(previousBet - 1))
          }
          
          it("should not decrement currentBet if currentBet is equal to 1") {
            let previousBet = 1
            scene.currentBet = previousBet
            
            scene.buttonTriggered(button: button)
            
            expect(scene.currentBet).to(equal(previousBet))
          }
        }
        
        context("up button") {
          beforeEach {
            button = buttonFactory.createButton(withIdentifier: .up)
          }
          
          it("should increment currentBet by 1 if wallet has enough to bet") {
            let previousBet = 1
            scene.currentBet = previousBet
            scene.wallet = 2
            
            scene.buttonTriggered(button: button)
            
            expect(scene.currentBet).to(equal(previousBet + 1))
          }
          
          it("should not increment currentBet if wallet does not have enough to bet") {
            let previousBet = 1
            scene.currentBet = previousBet
            scene.wallet = 1
            
            scene.buttonTriggered(button: button)
            
            expect(scene.currentBet).to(equal(previousBet))
          }
        }
      }
    }
  }
}
