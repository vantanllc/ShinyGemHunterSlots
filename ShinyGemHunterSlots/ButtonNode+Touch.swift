//
//  ButtonNode+Touch.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 7/16/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import SpriteKit

extension ButtonNode {
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)

    if containsTouches(touches: touches) {
      buttonTriggered()
    }
  }

  private func containsTouches(touches: Set<UITouch>) -> Bool {
    guard let scene = scene else {
      fatalError("Button must be used within a SKScene")
    }

    return touches.contains { touch in
      let touchPoint = touch.location(in: scene)
      let touchNode = scene.atPoint(touchPoint)
      return touchNode === self || touchNode.inParentHierarchy(self)
    }
  }
}
