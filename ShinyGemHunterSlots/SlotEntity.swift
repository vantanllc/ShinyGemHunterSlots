//
//  SlotEntity.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/19/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

class SlotEntity: GKEntity {
  init(node: SKSpriteNode) {
    super.init()
    
    let render = RenderComponent()
    render.node.zPosition = NodeLayerPosition.entity
    addComponent(render)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
