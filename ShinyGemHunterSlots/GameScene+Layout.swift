//
//  GameScene+Layout.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 7/15/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

extension GameScene {
  func addSlotGrid() {
    slotGridEntity = SlotGridEntity(gemColumns: slotMachine.columns)
    
    let node = slotGridEntity.component(ofType: RenderComponent.self)!.node
    layoutNodes()
    addChild(node)
  }
  
  func addLabels() {
    currentBetLabel = TLLabelNode(text: "Bet: \(currentBet)")
    addChild(currentBetLabel)
    
    walletLabel = TLLabelNode(text: "Wallet: \(wallet)")
    addChild(walletLabel)
    
    resultDisplay = TLLabelNode(text: "Press button to play!")
    addChild(resultDisplay)
  }
  
  func addButtons() {
    let buttonFactory = ButtonFactory()
    
    let yPosition = size.height * 0.15
    
    pullHandleButton = buttonFactory.createButton(withIdentifier: .pullHandle)
    pullHandleButton.position = CGPoint(x: size.width * 0.5, y: yPosition)
    addChild(pullHandleButton)
    
    upButton = buttonFactory.createButton(withIdentifier: .up)
    upButton.anchorPoint = CGPoint(x: 1, y: 0.5)
    upButton.position = CGPoint(x: size.width, y: yPosition)
    addChild(upButton)
    
    downButton = buttonFactory.createButton(withIdentifier: .down)
    downButton.anchorPoint = CGPoint(x: 0, y: 0.5)
    downButton.position = CGPoint(x: 0, y: yPosition)
    addChild(downButton)
  }
}

extension GameScene {
  func layoutNodes() {
    if let view = view, view.frame.width > view.frame.height {
      presentInLandscapeMode()
    } else {
      presentInProtraitMode()
    }
  }
  
  private func presentInProtraitMode() {
    currentBetLabel?.position = CGPoint(x: size.width * 0.25, y: 0)
    walletLabel?.position = CGPoint(x: size.width * 0.75, y: 0)
    
    pullHandleButton?.anchorPoint = CGPoint(x: 0.5, y: 0)
    pullHandleButton?.position = CGPoint(x: size.width * 0.5, y: walletLabel.frame.height)
    
    downButton?.anchorPoint = CGPoint(x: 0, y: 0.5)
    downButton?.position = CGPoint(x: 0, y: pullHandleButton.frame.midY)
    
    upButton?.anchorPoint = CGPoint(x: 1, y: 0.5)
    upButton?.position = CGPoint(x: size.width, y: pullHandleButton.frame.midY)
    
    resultDisplay?.anchorPoint = CGPoint(x: 0.5, y: 0)
    resultDisplay?.position = CGPoint(
      x: pullHandleButton.frame.midX,
      y: pullHandleButton.frame.maxY
    )
    
    slotGridEntity?.component(ofType: RenderComponent.self)?.node.position = CGPoint(x: size.width * 0.25, y: size.height * 0.80)
  }
  
  private func presentInLandscapeMode() {
    currentBetLabel?.position = CGPoint(x: size.width * 0.25, y: 0)
    walletLabel?.position = CGPoint(x: size.width * 0.75, y: 0)
    
    pullHandleButton?.anchorPoint = CGPoint(x: 1, y: 0)
    pullHandleButton?.position = CGPoint(x: size.width, y: walletLabel.frame.height)
    
    downButton?.anchorPoint = CGPoint(x: 0, y: 0.5)
    downButton?.position = CGPoint(x: 0, y: pullHandleButton.frame.midY)
    
    upButton?.anchorPoint = CGPoint(x: 0.5, y: 0)
    upButton?.position = CGPoint(x: downButton.frame.midX, y: downButton.frame.maxY)
    
    resultDisplay?.anchorPoint = CGPoint(x: 0.5, y: 1)
    resultDisplay?.position = CGPoint(
      x: size.width * 0.5,
      y: pullHandleButton.frame.minY
    )
    
    slotGridEntity?.component(ofType: RenderComponent.self)?.node.position = CGPoint(x: size.width * 0.3, y: size.height * 0.80)
  }
}
