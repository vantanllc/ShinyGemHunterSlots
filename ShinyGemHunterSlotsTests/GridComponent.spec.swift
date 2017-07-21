//
//  GridComponent.spec.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 5/6/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

import Quick
import Nimble
@testable import ShinyGemHunterSlots

class GridComponentSpec: QuickSpec {
  override func spec() {
    var grid: GridComponent!
    var gemColumns: [[Gem]]!
    
    describe("GridComponent") {
      beforeEach {
        gemColumns = [
          [.diamond, .ruby, .diamond],
          [.ruby, .ruby, .diamond],
          [.diamond, .ruby, .ruby],
        ]
        grid = GridComponent(gemColumns: gemColumns)
      }
      
      it("should have node") {
        expect(grid.node).notTo(beNil())
      }
      
      it("should create slot columns according to gem columns") {
        let slotColumns = grid.slotColumns.map { column in
          return column.component(ofType: ColumnComponent.self)?.gems
        }
        
        for (index, column) in slotColumns.enumerated() {
          expect(column).to(equal(gemColumns[index]))
        }
      }
      
      it("should add column render nodes to node") {
        let columnRenderNodes = grid.slotColumns.flatMap { column in
          return column.component(ofType: RenderComponent.self)?.node
        }
        
        for render in columnRenderNodes {
          expect(render.parent).to(be(grid.node))
        }
      }
      
      it("should have expected horizontal spacing between columns") {
        let horizontalSpacing = UIDevice.current.userInterfaceIdiom == .phone ? GridComponent.Config.iPhone.columnHorizontalSpacing : GridComponent.Config.iPad.columnHorizontalSpacing
        let expectedXPositions = [
          horizontalSpacing * 0,
          horizontalSpacing * 1,
          horizontalSpacing * 2,
        ]
        let columnXPositions = grid.slotColumns.map { column in
          return column.component(ofType: RenderComponent.self)?.node.position.x
        }
        
        expect(columnXPositions).to(equal(expectedXPositions))
      }
    }
  }
}
