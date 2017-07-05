//
//  TLLabelNode.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 7/5/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import SpriteKit

class TLLabelNode: SKSpriteNode {
  // MARK: Lifecycle
  init(text: String) {
    self.text = text
    super.init(texture: nil, color: .clear, size: .zero)
    label = SKLabelNode(text: text)
    addChild(label)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Properties
  var text: String? {
    didSet {
      label.text = text
    }
  }
  var label: SKLabelNode!
}
