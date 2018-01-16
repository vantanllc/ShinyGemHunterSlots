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

extension ColumnComponent {
  func addNewSlot() -> SlotEntity {
    let newSlot = SlotEntity(gem: Gem.getRandom())
    let verticalSpacing = UIDevice.current.userInterfaceIdiom == .phone ? Config.slotVerticalSpacingIphone : Config.slotVerticalSpacingIpad
    
    let newNode = newSlot.component(ofType: RenderComponent.self)!.node
    newNode.position.y = verticalSpacing * -1
    node.addChild(newNode)
    return newSlot
  }
  
  func rollSlots() {
    let move = SKAction.moveBy(x: 0, y: Config.slotVerticalSpacingIpad, duration: 1)
    let newSlot = addNewSlot()
    let addNewSlotty = SKAction.run {
      self.addNewSlot()
      let lastSlot = self.slots.popLast()?.component(ofType: RenderComponent.self)?.node.removeFromParent()
    }
    let seq = SKAction.sequence([move, addNewSlotty])
    newSlot.component(ofType: RenderComponent.self)?.node.run(seq)
    for slot in slots {
      let slotRenderNode = slot.component(ofType: RenderComponent.self)!.node
      slotRenderNode.run(move)
    }
    
    slots.insert(newSlot, at: 0)
  }
  
  func addSlots() {
    for (index, gem) in gems.enumerated() {
      let slot = SlotEntity(gem: gem)
      slots.append(slot)

      let verticalSpacing = UIDevice.current.userInterfaceIdiom == .phone ? Config.slotVerticalSpacingIphone : Config.slotVerticalSpacingIpad

      let slotRenderNode = slot.component(ofType: RenderComponent.self)!.node
      slotRenderNode.position.y = verticalSpacing * CGFloat(index)
      node.addChild(slotRenderNode)
    }
  }
}
