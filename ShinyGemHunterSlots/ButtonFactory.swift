//
//  ButtonFactory.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/6/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import SpriteKit

class ButtonFactory {
  func createButton(withIdentifier identifier: ButtonIdentifier) -> ButtonNode {
    let button = ButtonNode(texture: nil, color: .blue, size: CGSize(width: 60, height: 60))
    button.zPosition = NodeZPosition.button
    button.name = identifier.rawValue
    button.isUserInteractionEnabled = true
    return button
  }
}
