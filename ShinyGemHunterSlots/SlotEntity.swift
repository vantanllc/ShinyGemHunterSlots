//
//  SlotEntity.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/19/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

class SlotEntity: GKEntity {
  init(gem: Gem, node: SKSpriteNode) {
    super.init()
    
    let render = RenderComponent()
    render.node.zPosition = NodeLayerPosition.entity
    addComponent(render)
    
    let sprite = SpriteComponent(node: node)
    render.node.addChild(sprite.node)
    addComponent(sprite)
    
    let gemComponent = GemComponent(gem: gem)
    addComponent(gemComponent)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
