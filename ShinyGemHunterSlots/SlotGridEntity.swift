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
    
    let topBlackRow = SKSpriteNode(color: .black, size: CGSize(width: 1000, height: 120))
    topBlackRow.isUserInteractionEnabled = false
    topBlackRow.zPosition = NodeZPosition.entity
    topBlackRow.anchorPoint = CGPoint(x: 0, y: 1)
    topBlackRow.position.x = -200
    topBlackRow.position.y = 220
    render.node.addChild(topBlackRow)
    
    let bottomBlackRow = SKSpriteNode(color: .black, size: CGSize(width: 1000, height: 400))
    bottomBlackRow.isUserInteractionEnabled = false
    bottomBlackRow.zPosition = NodeZPosition.entity
    bottomBlackRow.anchorPoint = CGPoint(x: 0, y: 1)
    bottomBlackRow.position.x = -200
    bottomBlackRow.position.y = -500
    render.node.addChild(bottomBlackRow)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
