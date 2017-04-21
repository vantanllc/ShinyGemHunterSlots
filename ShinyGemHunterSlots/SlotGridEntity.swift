//
//  SlotGridEntity.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/20/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

class SlotGridEntity: GKEntity {
  init(columns: [[Gem]]) {
    super.init()
    let render = RenderComponent()
    render.node.zPosition = NodeZPosition.entity
    addComponent(render)
    
    let grid = GridComponent(columns: columns)
    render.node.addChild(grid.node)
    addComponent(grid)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
