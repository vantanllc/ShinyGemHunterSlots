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

  func addButton(withIdentifier identifier: ButtonIdentifier,
                 withPosition position: CGPoint,
                 withAnchorPoint anchorPoint: CGPoint = CGPoint(x: 0.5, y: 0.5)
    ) -> ButtonNode {
    let buttonFactory = ButtonFactory()

    let button = buttonFactory.createButton(withIdentifier: identifier)
    button.anchorPoint = anchorPoint
    button.position = position
    return button
  }

  func addPullHandleButton() {
    let yPosition = size.height * 0.15
    let position = CGPoint(x: size.width * 0.5, y: yPosition)
    pullHandleButton = addButton(withIdentifier: .pullHandle,
                                 withPosition: position)
    addChild(pullHandleButton)
  }

  func addUpButton() {
    let yPosition = size.height * 0.15
    let anchorPoint = CGPoint(x: 1, y: 0.5)
    let position = CGPoint(x: size.width, y: yPosition)
    upButton = addButton(withIdentifier: .up,
                         withPosition: position,
                         withAnchorPoint: anchorPoint)
    addChild(upButton)
  }

  func addDownButton() {
    let yPosition = size.height * 0.15
    let anchorPoint = CGPoint(x: 0, y: 0.5)
    let position = CGPoint(x: 0, y: yPosition)
    downButton = addButton(withIdentifier: .down,
                         withPosition: position,
                         withAnchorPoint: anchorPoint)
    addChild(downButton)
  }
  
  func addWatchAdsButton() {
    let anchorPoint = CGPoint(x: 0, y: 1)
    let position = CGPoint(x: 0, y: size.height)
    watchAdsButton = addButton(withIdentifier: .watchAds,
                         withPosition: position,
                         withAnchorPoint: anchorPoint)
    addChild(watchAdsButton)
  }

  func addMaxBetButton() {
    let anchorPoint = CGPoint(x: 0.5, y: 0)
    let position = CGPoint(x: upButton.frame.midX, y: upButton.frame.maxY)
    maxBetButton = addButton(withIdentifier: .maxBet,
                         withPosition: position,
                         withAnchorPoint: anchorPoint)
    addChild(maxBetButton)
  }

  func addButtons() {
    addPullHandleButton()
    addUpButton()
    addDownButton()
    addMaxBetButton()
    addWatchAdsButton()
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
