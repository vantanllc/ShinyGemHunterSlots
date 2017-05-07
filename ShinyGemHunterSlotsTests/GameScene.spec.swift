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
      
      context("sceneDidLoad") {
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
      }
    }
  }
}
