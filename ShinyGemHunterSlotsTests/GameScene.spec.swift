//
//  GameScene.spec.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 5/7/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

import Quick
import Nimble
@testable import ShinyGemHunterSlots

class GameSceneSpec: QuickSpec {
  override func spec() {
    describe("GameScene") {
      var scene: GameScene!
      
      beforeEach {
        scene = GameScene()
      }
      
      context("currentBet changes") {
        it("should update currentBetLabel text") {
          let randomNumber = 83749
          scene.currentBet = randomNumber
          
          expect(scene.currentBetLabel.text).to(equal("Bet: \(randomNumber)"))
        }
      }
      
      context("wallet changes") {
        it("should update walletLabel text") {
          let randomNumber = 83749
          scene.wallet = randomNumber
          
          expect(scene.walletLabel.text).to(equal("Wallet: \(randomNumber)"))
        }
      }
      
      context("sceneDidLoad") {
        it("should initialize slotMachine") {
          expect(scene.slotMachine).toNot(beNil())
        }
        
        context("slotGridEntity") {
          it("should have node be in scene") {
            let node = scene.slotGridEntity.component(ofType: RenderComponent.self)?.node
            expect(node?.parent).to(be(scene))
          }
          
          it("should have gem columns from slotMachine") {
            let gemColumns = scene.slotGridEntity.component(ofType: GridComponent.self)!.gemColumns
            for (index, column) in gemColumns.enumerated() {
              expect(column).to(equal(scene.slotMachine.columns[index]))
            }
          }
        }
        
        context("labels") {
          context("currentBet") {
            it("should have fontSize set from Config") {
              expect(scene.currentBetLabel.fontSize).to(equal(GameScene.Config.Label.fontSize))
            }
            
            it("should be child of scene") {
              expect(scene.currentBetLabel.parent).to(be(scene))
            }
            
            it("should display current bet") {
              let expectedText = "Bet: \(scene.currentBet)"
              expect(scene.currentBetLabel.text).to(equal(expectedText))
            }
          }
          
          context("wallet") {
            it("should have fontSize set from Config") {
              expect(scene.walletLabel.fontSize).to(equal(GameScene.Config.Label.fontSize))
            }
            
            it("should be child of scene") {
              expect(scene.walletLabel.parent).to(be(scene))
            }
            
            it("should display wallet") {
              let expectedText = "Wallet: \(scene.wallet)"
              expect(scene.walletLabel.text).to(equal(expectedText))
            }
          }
          
          context("resultDisplay") {
            it("should have fontSize set from Config") {
              expect(scene.resultDisplay.fontSize).to(equal(GameScene.Config.Label.fontSize))
            }
            
            it("should be child of scene") {
              expect(scene.resultDisplay.parent).to(be(scene))
            }
            
            it("should display greetings") {
              let expectedText = "Press button to play!"
              expect(scene.resultDisplay.text).to(equal(expectedText))
            }
          }
        }
        
        context("buttons") {
          it("should have pullHandle button in scene") {
            expect(scene.childNode(withName: ButtonIdentifier.pullHandle.rawValue)).toNot(beNil())
          }
          
          it("should have up button in scene") {
            expect(scene.childNode(withName: ButtonIdentifier.up.rawValue)).toNot(beNil())
          }
          
          it("should have down button in scene") {
            expect(scene.childNode(withName: ButtonIdentifier.down.rawValue)).toNot(beNil())
          }
        }
      }
    }
  }
}
