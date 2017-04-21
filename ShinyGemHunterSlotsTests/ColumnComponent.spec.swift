//
//  ColumnComponent.spec.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/19/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

import Quick
import Nimble
@testable import ShinyGemHunterSlots

class ColumnComponentSpec: QuickSpec {
  override func spec() {
    var column: ColumnComponent!
    var gems: [Gem]!
    
    describe("ColumnComponent") {
      beforeEach {
        gems = [.diamond, .ruby, .diamond]
        column = ColumnComponent(gems: gems)
      }
      
      it("should create slots according to gems") {
        let slotGems = column.slots.flatMap { slot in
          return slot.component(ofType: GemComponent.self)?.gem
        }
        
        expect(slotGems).to(equal(gems))
      }
      
      it("should add slots' render node to column component node") {
        let slotRenderNodes = column.slots.flatMap { slot in
          return slot.component(ofType: RenderComponent.self)?.node
        }
        
        for render in slotRenderNodes {
          expect(render.parent).to(be(column.node))
        }
      }
      
      
    }
  }
}
