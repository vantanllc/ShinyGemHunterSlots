//
//  GameScene+StateMachine.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 7/15/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

extension GameScene {
  func loadStateMachine() {
    let states: [GKState] = [
      GameSceneActiveState(gameScene: self),
      GameSceneIdleState(gameScene: self),
    ]
    stateMachine = GKStateMachine(states: states)
  }
}
