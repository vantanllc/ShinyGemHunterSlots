//
//  Gem.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/19/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

enum Gem: String {
  case diamond, ruby, amethyst

  static let all: [Gem] = [
    .diamond,
    .ruby,
    .amethyst
  ]

  func getNode() -> SKSpriteNode {
    return SKSpriteNode(imageNamed: self.rawValue)
  }

  static func getRandom(randomSource: GKRandomSource) -> Gem {
    let gem: Gem

    switch randomSource.nextInt(upperBound: all.count) {
    case 0:
      gem = .diamond
    case 1:
      gem = .ruby
    default:
      gem = .amethyst
    }

    return gem
  }
}
