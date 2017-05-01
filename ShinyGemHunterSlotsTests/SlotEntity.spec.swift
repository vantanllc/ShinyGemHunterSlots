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
    var gem: Gem!

    describe("SlotEntity") {
      beforeEach {
        gem = .diamond
        entity = SlotEntity(gem: gem)
      }
      
      context("RenderComponent") {
        var render: RenderComponent!
        
        beforeEach {
          render = entity.component(ofType: RenderComponent.self)
        }
        
        it("should have a RenderComponent") {
          expect(render).toNot(beNil())
        }
        
        it("should set node zPosition to NodeLayerPosition.entity") {
          expect(render.node.zPosition).to(equal(NodeZPosition.entity))
        }
      }
      
      context("SpriteComponent") {
        var spriteComponent: SpriteComponent!
        
        beforeEach {
          spriteComponent = entity.component(ofType: SpriteComponent.self)
        }
        
        it("should have SpriteComponent") {
          expect(spriteComponent).toNot(beNil())
        }
      }
      
      context("GemComponent") {
        var gemComponent: GemComponent!
        
        beforeEach {
          gemComponent = entity.component(ofType: GemComponent.self)
        }
        
        it("should have a GemComponent") {
          expect(gemComponent).toNot(beNil())
        }
        
        it("should set gem") {
          expect(gemComponent.gem).to(equal(gem))
        }
      }
    }
  }
}
