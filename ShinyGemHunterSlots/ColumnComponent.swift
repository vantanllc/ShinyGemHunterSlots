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

    super.init()

    addSlots()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Properties
  let gems: [Gem]
  var slots: [SlotEntity]
  let node: SKNode
}

fileprivate extension ColumnComponent {
  func addSlots() {
    for (index, gem) in gems.enumerated() {
      let slot = SlotEntity(gem: gem)
      slots.append(slot)
      
      let verticalSpacing = UIDevice.current.userInterfaceIdiom == .phone ? Config.iPhone.slotVerticalSpacing : Config.iPad.slotVerticalSpacing

      let slotRenderNode = slot.component(ofType: RenderComponent.self)!.node
      slotRenderNode.position.y = verticalSpacing * CGFloat(index)
      node.addChild(slotRenderNode)
    }
  }
}
