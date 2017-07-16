//
//  SlotEntity.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/19/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

class SlotEntity: GKEntity {
  // MARK: Lifecycle
  init(gem: Gem) {
    super.init()

    let render = RenderComponent()
    render.node.zPosition = NodeZPosition.entity
    addComponent(render)

    let sprite = SpriteComponent(node: gem.getNode())
    render.node.addChild(sprite.node)
    addComponent(sprite)

    let gemComponent = GemComponent(gem: gem)
    addComponent(gemComponent)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
