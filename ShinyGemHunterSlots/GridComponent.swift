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

fileprivate extension GridComponent {
  func addSlotColumns() {
    for (index, column) in gemColumns.enumerated() {
      let slotColumn = SlotColumnEntity(gems: column)
      slotColumns.append(slotColumn)

      let slotColumnRenderNode = slotColumn.component(ofType: RenderComponent.self)!.node

      let horizontalSpacing = UIDevice.current.userInterfaceIdiom == .phone ? Config.columnHorizontalSpacingIphone : Config.columnHorizontalSpacingIpad
      slotColumnRenderNode.position.x = horizontalSpacing * CGFloat(index)
      node.addChild(slotColumnRenderNode)
    }
  }
}
