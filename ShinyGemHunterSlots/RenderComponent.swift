//
//  RenderComponent.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/19/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

class RenderComponent: GKComponent {
  // MARK: Override Functions
  override func didAddToEntity() {
    node.entity = entity
  }

  override func willRemoveFromEntity() {
    node.entity = nil
  }

  // MARK: Properties
  let node = SKNode()
}
