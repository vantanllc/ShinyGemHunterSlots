//
//  ButtonFactory.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/6/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import SpriteKit

struct ButtonFactory {
  func createButton(withIdentifier identifier: ButtonIdentifier) -> ButtonNode {
    let button = ButtonNode(imageNamed: identifier.rawValue)
    button.zPosition = NodeZPosition.button
    button.name = identifier.rawValue
    button.isUserInteractionEnabled = true
    return button
  }
}
