//
//  SlotGridEntity.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/20/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

class SlotGridEntity: GKEntity {
  // MARK: Lifecycle
  init(gemColumns: [[Gem]]) {
    super.init()
    let render = RenderComponent()
    render.node.zPosition = NodeZPosition.entity
    addComponent(render)

    let grid = GridComponent(gemColumns: gemColumns)
    render.node.addChild(grid.node)
    addComponent(grid)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
