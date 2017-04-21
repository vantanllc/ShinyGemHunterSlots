//
//  ColumnComponent.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/19/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

class ColumnComponent: GKComponent {
  // MARK: Lifecycle
  init(gems: [Gem]) {
    self.gems = gems
    node = SKNode()
    slots = []
    for (index, gem) in gems.enumerated() {
      let slot = SlotEntity(gem: gem, node: SKSpriteNode(color: .red, size: CGSize(width: 40, height: 40)))
      slots.append(slot)
      
      let slotRenderNode = slot.component(ofType: RenderComponent.self)!.node
      slotRenderNode.position.y = -90 * CGFloat(index)
      node.addChild(slotRenderNode)
    }
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Properties
  let gems: [Gem]
  var slots: [SlotEntity]
  let node: SKNode
}
