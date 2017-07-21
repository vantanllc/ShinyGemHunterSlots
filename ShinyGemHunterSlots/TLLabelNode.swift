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
    label = SKLabelNode(text: text)
    label.fontSize = UIDevice.current.userInterfaceIdiom == .phone ? iPhoneConfig.fontSize : iPadConfig.fontSize
    label.verticalAlignmentMode = .bottom
    super.init(texture: nil, color: .clear, size: label.frame.size)
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

extension TLLabelNode {
  struct iPhoneConfig {
    static let fontSize: CGFloat = 30
  }
  struct iPadConfig {
    static let fontSize: CGFloat = 70
  }
}
