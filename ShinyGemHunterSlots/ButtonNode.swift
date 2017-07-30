//
//  ButtonNode.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/6/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import SpriteKit

enum ButtonIdentifier: String {
  case pullHandle, up, down, maxBet
}

class ButtonNode: SKSpriteNode {
  // MARK: Properties
  var buttonIdentifier: ButtonIdentifier? {
    var identifier: ButtonIdentifier?
    if let name = name {
      identifier = ButtonIdentifier(rawValue: name)
    }
    return identifier
  }

  var responder: ButtonRespondable? {
    guard let responder = scene as? ButtonRespondable else {
      return nil
    }
    return responder
  }
}
