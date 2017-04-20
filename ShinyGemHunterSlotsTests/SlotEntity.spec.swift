//
//  SlotEntity.spec.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/19/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

import Quick
import Nimble
@testable import ShinyGemHunterSlots

class SlotEntitySpec: QuickSpec {
  override func spec() {
    var entity: SlotEntity!
    var sprite: SKSpriteNode!
    let size = CGSize(width: 10, height: 20)

    describe("SlotEntity") {
      beforeEach {
        sprite = SKSpriteNode(color: .blue, size: size)
        entity = SlotEntity(node: sprite)
      }
      
      describe("RenderComponent") {
        var render: RenderComponent!
        
        beforeEach {
          render = entity.component(ofType: RenderComponent.self)
        }
        
        it("should have a RenderComponent") {
          expect(render).toNot(beNil())
        }
        
        it("should set node zPosition to NodeLayerPosition.entity") {
          expect(render.node.zPosition).to(equal(NodeLayerPosition.entity))
        }
      }
    }
  }
}
