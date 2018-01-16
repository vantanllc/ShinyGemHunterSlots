//
//  GameSceneActiveState+GKState.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 7/16/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

extension GameSceneActiveState {
  override func handleButtonTriggered(button: ButtonNode) {
    guard let buttonIdentifier = button.buttonIdentifier else {
      return
    }

    switch buttonIdentifier {
    case .pullHandle:
      handlePullHandle()
    case .up:
      handleUp()
    case .down:
      handleDown()
    case .maxBet:
      gameScene.currentBet = gameScene.wallet
    case .watchAds:
      gameScene.adDelegate?.showRewardVideoAds()
    }
  }

  private func handleDown() {
    if gameScene.currentBet > 1 {
      gameScene.currentBet -= 1
    }
  }

  private func handleUp() {
    if gameScene.currentBet < gameScene.wallet {
      gameScene.currentBet += 1
    }
  }

  private func handlePullHandle() {
      gameScene.slotMachine.updateColumns()
      gameScene.resetSlotGridEntity(withColumns: gameScene.slotMachine.columns)
      gameScene.animateColumns()
      gameScene.evaluateSlotReel()
  }
}
