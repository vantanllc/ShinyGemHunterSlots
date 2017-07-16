//
//  GameSceneActiveState.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 7/3/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

class GameSceneActiveState: GKState {
  // MARK: Lifecycle
  init(gameScene: GameScene) {
    self.gameScene = gameScene
  }

  // MARK: Properties
  let gameScene: GameScene
}
