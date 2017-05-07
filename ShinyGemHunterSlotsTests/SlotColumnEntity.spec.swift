//
//  SlotColumnEntity.spec.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/19/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

import Quick
import Nimble
@testable import ShinyGemHunterSlots

class SlotColumnEntitySpec: QuickSpec {
  override func spec() {
    var entity: SlotColumnEntity!
    var gems: [Gem]!
    
    describe("SlotColumnEntity") {
      beforeEach {
        gems = [.diamond, .ruby, .diamond]
        entity = SlotColumnEntity(gems: gems)
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
      
      context("ColumnComponent") {
        var column: ColumnComponent!
        
        beforeEach {
          column = entity.component(ofType: ColumnComponent.self)
        }
        
        it("should have a ColumnComponent") {
          expect(column).toNot(beNil())
        }
        
        it("should add node to RenderComponent.node") {
          let render = entity.component(ofType: RenderComponent.self)!
          expect(column.node.parent).to(be(render.node))
        }
      }
    }
  }
}
