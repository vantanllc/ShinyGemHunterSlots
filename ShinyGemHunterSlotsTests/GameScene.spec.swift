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
      var mockUserDefaults: MockUserDefaults!
      let randomNumber = 83749
      
      beforeEach {
        mockUserDefaults = MockUserDefaults()
        mockUserDefaults.set(true, forKey: UserDefaultsService.Keys.didReceiveInitialWalletCash)
        let userDefaultsService = UserDefaultsService(userDefaults: mockUserDefaults)
        scene = GameScene(size: CGSize(),
                          randomSource: GKRandomSource(),
                          userDefaultsService: userDefaultsService)
      }
      
      context("didMove") {
        it("should be in active state") {
          scene.didMove(to: SKView())
          expect(scene.stateMachine.currentState).to(beAKindOf(GameSceneActiveState.self))
        }
      }
      
      context("currentBet changes") {
        it("should update currentBetLabel text") {
          scene.currentBet = randomNumber
          
          expect(scene.currentBetLabel.text).to(equal("Bet: \(randomNumber)"))
        }
      }
      
      context("wallet changes") {
        it("should update walletLabel text") {
          scene.wallet = randomNumber
          
          expect(scene.walletLabel.text).to(equal("Wallet: \(randomNumber)"))
        }
        
        it("should update userDefaults with player's new wallet") {
          scene.wallet = randomNumber
          
          expect(scene.userDefaultsService.getPlayerWallet()).to(equal(randomNumber))
        }
      }
      
      context("no money in wallet") {
        it("should be in idle state") {
          scene.wallet = 0
          expect(scene.stateMachine.currentState).to(beAKindOf(GameSceneIdleState.self))
        }
        
        it("should update currentBet") {
          scene.wallet = 0
          expect(scene.currentBet).to(equal(scene.wallet))
        }
      }
      
      context("evaluateSlotReel") {
        var mockSlotMachine: MockSlotMachine!
        let gems: [[Gem]] = [[]]
        
        beforeEach {
          mockSlotMachine = MockSlotMachine(columns: gems, randomSource: GKRandomSource.sharedRandom())
          scene.slotMachine = mockSlotMachine
        }
        
        context("didWin returns true") {
          beforeEach {
            mockSlotMachine.didWinReturn = true
          }
          
          it("should update wallet with winnings") {
            let previousWallet = scene.wallet
            let winnings = scene.currentBet * GameScene.Config.winningMultiplier
            
            scene.evaluateSlotReel()
            
            expect(scene.wallet).to(equal(previousWallet + winnings))
          }
          
          it("should update resultLabel with winnings") {
            let winnings = scene.currentBet * GameScene.Config.winningMultiplier
            
            scene.evaluateSlotReel()
            
            expect(scene.resultDisplay.text).to(equal("YOU WON \(winnings)! YAY!!!"))
          }
        }
        
        context("didWin returns false") {
          beforeEach {
            mockSlotMachine.didWinReturn = false
          }
          
          it("should update wallet with loss") {
            let previousWallet = scene.wallet
            
            scene.evaluateSlotReel()
            
            expect(scene.wallet).to(equal(previousWallet - scene.currentBet))
          }
          
          it("should update resultLabel with loss") {
            scene.evaluateSlotReel()
            
            expect(scene.resultDisplay.text).to(equal("YOU LOST \(scene.currentBet)! BOO!!!"))
          }
        }
      }
      
      context("sceneDidLoad") {
        afterEach {
          mockUserDefaults.clearKeyValues()
        }
        
        it("should initialize slotMachine") {
          expect(scene.slotMachine).toNot(beNil())
        }
        
        context("loading previous wallet") {
          it("should set wallet from userDefaults") {
            mockUserDefaults = MockUserDefaults()
            mockUserDefaults.set(true, forKey: UserDefaultsService.Keys.didReceiveInitialWalletCash)
            mockUserDefaults.set(mockUserDefaults.playerWallet, forKey: UserDefaultsService.Keys.playerWallet)
            let mockUserDefaultsService = UserDefaultsService(userDefaults: mockUserDefaults)
            scene = GameScene(size: CGSize(),
                              randomSource: GKRandomSource(),
                              userDefaultsService: mockUserDefaultsService)
            expect(scene.wallet).to(equal(mockUserDefaults.playerWallet))
          }
        }
        
        context("is new player") {
          beforeEach {
            mockUserDefaults = MockUserDefaults()
            mockUserDefaults.set(false, forKey: UserDefaultsService.Keys.didReceiveInitialWalletCash)
            let mockUserDefaultsService = UserDefaultsService(userDefaults: mockUserDefaults)
            scene = GameScene(size: CGSize(),
                              randomSource: GKRandomSource(),
                              userDefaultsService: mockUserDefaultsService)
          }
          
          it("should set wallet to initial wallet value for new player") {
            expect(scene.wallet).to(equal(20))
          }
          
          it("should set didReceiveInitialWalletCash to true") {
            expect(scene.userDefaultsService.didReceiveInitialWalletCash()).to(beTrue())
          }
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
              let fontSize = UIDevice.current.userInterfaceIdiom == .phone ? TLLabelNode.iPhoneConfig.fontSize : TLLabelNode.iPadConfig.fontSize
              expect(scene.currentBetLabel.label.fontSize).to(equal(fontSize))
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
              let fontSize = UIDevice.current.userInterfaceIdiom == .phone ? TLLabelNode.iPhoneConfig.fontSize : TLLabelNode.iPadConfig.fontSize
              expect(scene.walletLabel.label.fontSize).to(equal(fontSize))
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
              let fontSize = UIDevice.current.userInterfaceIdiom == .phone ? TLLabelNode.iPhoneConfig.fontSize : TLLabelNode.iPadConfig.fontSize
              expect(scene.resultDisplay.label.fontSize).to(equal(fontSize))
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
