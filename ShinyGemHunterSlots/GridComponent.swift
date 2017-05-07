//
//  GridComponent.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/20/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

class GridComponent: GKComponent {
  // MARK: Lifecycle
  init(gemColumns: [[Gem]]) {
    self.gemColumns = gemColumns 
    node = SKNode()
    slotColumns = []
    
    super.init()
    
    addSlotColumns()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Properties
  let gemColumns: [[Gem]]
  var slotColumns: [SlotColumnEntity]
  let node: SKNode
}

extension GridComponent {
  struct Config {
    static let columnHorizontalSpacing: CGFloat = 200
  }
}

fileprivate extension GridComponent {
  func addSlotColumns() {
    for (index, column) in gemColumns.enumerated() {
      let slotColumn = SlotColumnEntity(gems: column)
      slotColumns.append(slotColumn)
      
      let slotColumnRenderNode = slotColumn.component(ofType: RenderComponent.self)!.node
      
      slotColumnRenderNode.position.x = 200 * CGFloat(index)
      node.addChild(slotColumnRenderNode)
    }
  }
}
