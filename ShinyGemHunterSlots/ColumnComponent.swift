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
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Properties
  let gems: [Gem]
}
