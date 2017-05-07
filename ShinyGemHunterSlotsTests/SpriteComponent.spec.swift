//
//  SpriteComponent.spec.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/19/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

import Quick
import Nimble
@testable import ShinyGemHunterSlots

class SpriteComponentSpec: QuickSpec {
  override func spec() {
    var sprite: SpriteComponent!
    
    describe("SpriteComponent") {
      it("should have a SKSpriteNode") {
        let node = SKSpriteNode()
        sprite = SpriteComponent(node: node)
        expect(sprite.node).to(be(node))
      }
    }
  }
}
