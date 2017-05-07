//
//  Gem.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/19/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import SpriteKit

enum Gem: String {
  case diamond, ruby, amethyst
  
  func getNode() -> SKSpriteNode {
    return SKSpriteNode(imageNamed: self.rawValue)
  }
  
}
