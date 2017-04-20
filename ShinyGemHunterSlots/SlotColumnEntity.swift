//
//  SlotColumnEntity.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/19/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

class SlotColumnEntity: GKEntity {
  init(gems: [Gem]) {
    super.init()
    let render = RenderComponent()
    render.node.zPosition = NodeLayerPosition.entity
    addComponent(render)
    
    let column = ColumnComponent(gems: gems)
    addComponent(column)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
