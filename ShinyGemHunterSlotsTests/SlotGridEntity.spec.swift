//
//  SlotGridEntity.spec.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 5/6/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

import Quick
import Nimble
@testable import ShinyGemHunterSlots

class GridColumnEntitySpec: QuickSpec {
  override func spec() {
    var entity: SlotGridEntity!
    var gemColumns: [[Gem]]!
    
    describe("SlotGridEntity") {
      beforeEach {
        let gems: [Gem] = [.diamond, .ruby, .diamond]
        gemColumns = [gems, gems, gems]
        entity = SlotGridEntity(gemColumns: gemColumns)
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
      
      context("GridComponent") {
        var grid: GridComponent!
        
        beforeEach {
          grid = entity.component(ofType: GridComponent.self)
        }
        
        it("should have a GridComponent") {
          expect(grid).toNot(beNil())
        }
        
        it("should add node to RenderComponent.node") {
          let render = entity.component(ofType: RenderComponent.self)!
          expect(grid.node.parent).to(be(render.node))
        }
      }
    }
  }
}
