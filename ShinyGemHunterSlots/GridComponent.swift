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
  init(columns: [[Gem]]) {
    self.columns = columns
    node = SKNode()
    slotColumns = []
    
    for (index, column) in columns.enumerated() {
      let slotColumn = SlotColumnEntity(gems: column)
      slotColumns.append(slotColumn)
      
      let slotColumnRenderNode = slotColumn.component(ofType: RenderComponent.self)!.node
      
      slotColumnRenderNode.position.x = 200 * CGFloat(index)
      node.addChild(slotColumnRenderNode)
    }
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Properties
  let columns: [[Gem]]
  var slotColumns: [SlotColumnEntity]
  let node: SKNode
}
