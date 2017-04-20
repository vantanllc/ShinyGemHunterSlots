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
    slots = []
    for gem in gems {
      slots.append(SlotEntity(gem: gem, node: SKSpriteNode(color: .red, size: CGSize(width: 10, height: 10))))
    }
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Properties
  let gems: [Gem]
  var slots: [SlotEntity]
}
