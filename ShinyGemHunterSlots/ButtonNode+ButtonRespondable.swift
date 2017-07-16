//
//  ButtonNode+ButtonRespondable.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 7/16/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import SpriteKit

extension ButtonNode {
  func buttonTriggered() {
    if isUserInteractionEnabled {
      responder?.buttonTriggered(button: self)
    }
  }
}
