//
//  GameSceneActiveState.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 7/3/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

class GameSceneActiveState: GKState {
  // MARK: Functions
  override func handleButtonTriggered(button: ButtonNode) {
    guard let buttonIdentifier = button.buttonIdentifier else {
      return
    }

    switch buttonIdentifier {
    case .pullHandle:
      gameScene.slotMachine.updateColumns()
      gameScene.resetSlotGridEntity(withColumns: gameScene.slotMachine.columns)
      gameScene.evaluateSlotReel()
    case .up:
      if gameScene.currentBet < gameScene.wallet {
        gameScene.currentBet += 1
      }
    case .down:
      if gameScene.currentBet > 1 {
        gameScene.currentBet -= 1
      }
    }
  }

  // MARK: Lifecycle
  init(gameScene: GameScene) {
    self.gameScene = gameScene
  }

  // MARK: Properties
  let gameScene: GameScene
}
