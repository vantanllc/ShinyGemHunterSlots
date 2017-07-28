//
//  GameScene.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/6/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

class GameScene: SKScene {
  // MARK: Lifecycle
  init(size: CGSize, randomSource: GKRandomSource, userDefaults: UserDefaults) {
    sharedRandom = randomSource
    self.userDefaults = userDefaults
    super.init(size: size)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func sceneDidLoad() {
    loadStateMachine()
    addLabels()
    addButtons()
    
    wallet = userDefaults.integer(forKey: "playerWallet")

    let gems: [[Gem]] = [
      [.diamond, .diamond, .diamond],
      [.diamond, .diamond, .diamond],
      [.diamond, .diamond, .diamond]
    ]
    slotMachine = SlotMachine(columns: gems, randomSource: sharedRandom)
    resetSlotGridEntity(withColumns: gems)
  }

  override func didMove(to view: SKView) {
    stateMachine.enter(GameSceneActiveState.self)
    layoutNodes()
  }

  override func didChangeSize(_ oldSize: CGSize) {
    super.didChangeSize(oldSize)
    layoutNodes()
  }

  // MARK: Properties
  var wallet: Int = 100 {
    didSet {
      walletLabel.text = "Wallet: \(wallet)"
    }
    willSet {
      if newValue == 0 {
        stateMachine.enter(GameSceneIdleState.self)
      }
      if newValue < currentBet {
        currentBet = newValue
      }
    }
  }
  var currentBet: Int = 1 {
    didSet {
      currentBetLabel.text = "Bet: \(currentBet)"
    }
  }
  // MARK: Timing
  var lastUpdateTime: TimeInterval = 0

  var walletLabel: TLLabelNode!
  var currentBetLabel: TLLabelNode!
  var resultDisplay: TLLabelNode!
  var slotMachine: SlotMachine!
  var slotGridEntity: SlotGridEntity!

  var stateMachine: GKStateMachine!
  let sharedRandom: GKRandomSource
  let userDefaults: UserDefaults

  var upButton: ButtonNode!
  var downButton: ButtonNode!
  var pullHandleButton: ButtonNode!
}
