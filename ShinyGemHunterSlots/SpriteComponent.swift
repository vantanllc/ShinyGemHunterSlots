//
//  SpriteComponent.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/19/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

class SpriteComponent: GKComponent {
  // MARK: Lifecycle
  init(node: SKSpriteNode) {
    self.node = node
    super.init()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Properties
  let node: SKSpriteNode
}
