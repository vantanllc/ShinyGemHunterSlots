//
//  RenderComponent.spec.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/19/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

import Quick
import Nimble
@testable import ShinyGemHunterSlots

class RenderComponentSpec: QuickSpec {
  override func spec() {
    var render: RenderComponent!
    var entity: GKEntity!
    
    describe("RenderComponent") {
      beforeEach {
        render = RenderComponent()
        entity = GKEntity()
      }
      
      it("should have a SKNode property") {
        expect(render.node).toNot(beNil())
      }
      
      context("didAddToEntity") {
        it("should assign node.entity to self.entity") {
          entity.addComponent(render)
          expect(render.node.entity).to(be(entity))
        }
      }
      
      context("willRemoveFromEntity") {
        it("should assign node.entity to nil") {
          entity.addComponent(render)
          entity.removeComponent(ofType: RenderComponent.self)
          expect(render.node.entity).to(beNil())
        }
      }
    }
  }
}
