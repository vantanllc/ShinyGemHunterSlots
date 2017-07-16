//
//  GameScene+Update.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 7/15/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

extension GameScene {
  override func update(_ currentTime: TimeInterval) {
    super.update(currentTime)
    
    if lastUpdateTime.isZero {
      lastUpdateTime = currentTime
    }
    
    let deltaTime = currentTime - lastUpdateTime
    lastUpdateTime = currentTime
    
    stateMachine.update(deltaTime: deltaTime)
  }
}
