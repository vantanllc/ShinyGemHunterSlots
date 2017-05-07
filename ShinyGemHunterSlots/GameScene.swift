//
//  GameScene.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/6/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
  // MARK: Lifecycle
  override func sceneDidLoad() {
    addLabels()
    addButtons()
    slotMachine = SlotMachine()
    addSlotGrid()
  }
  
  // MARK: Properties
  var wallet: Int = 100 {
    didSet {
      walletLabel.text = "Wallet: \(wallet)"
    }
  }
  var currentBet: Int = 1 {
    didSet {
      currentBetLabel.text = "Bet: \(currentBet)"
    }
  }
  var walletLabel: SKLabelNode!
  var currentBetLabel: SKLabelNode!
  var slotsDisplay: SKLabelNode!
  var resultDisplay: SKLabelNode!
  var slotMachine: SlotMachine!
  var slotGridEntity: SlotGridEntity!
  weak var gameSceneDelegate: GameSceneDelegate?
}

extension GameScene {
  func resetSlotGridEntity(withColumns columns: [[Gem]]) {
    let oldNode = slotGridEntity.component(ofType: RenderComponent.self)?.node
    oldNode?.removeFromParent()
    
    addSlotGrid()
  }
}

fileprivate extension GameScene {
  func addSlotGrid() {
    slotGridEntity = SlotGridEntity(gemColumns: slotMachine.columns)
    let node = slotGridEntity.component(ofType: RenderComponent.self)!.node
    node.position = CGPoint(x: size.width * 0.25, y: size.height * 0.80)
    addChild(node)
  }
  
  func addLabels() {
    addResultDisplay()
    addBettingLabel()
    addWalletLabel()
  }
  
  func addBettingLabel() {
    currentBetLabel = SKLabelNode(text: "Bet: \(currentBet)")
    currentBetLabel.fontSize = 70
    currentBetLabel.position = CGPoint(x: size.width * 0.5, y: size.height * 0.95)
    addChild(currentBetLabel)
  }
  
  func addWalletLabel() {
    walletLabel = SKLabelNode(text: "Wallet: \(wallet)")
    walletLabel.fontSize = 70
    walletLabel.position = CGPoint(x: size.width * 0.5, y: 0)
    addChild(walletLabel)
  }
  
  func addResultDisplay() {
    resultDisplay = SKLabelNode(text: "Press blue button!")
    resultDisplay.fontSize = 70
    resultDisplay.position = CGPoint(x: size.width * 0.5, y: size.height * 0.25)
    addChild(resultDisplay)
  }
  
  func addButtons() {
    let buttonFactory = ButtonFactory()
    
    let pullHandleButton = buttonFactory.createButton(withIdentifier: .pullHandle)
    pullHandleButton.position = CGPoint(x: size.width * 0.5, y: size.height * 0.15)
    addChild(pullHandleButton)
    
    let upButton = buttonFactory.createButton(withIdentifier: .up)
    upButton.position = CGPoint(x: size.width * 0.80, y: size.height * 0.15)
    addChild(upButton)
    
    let downButton = buttonFactory.createButton(withIdentifier: .down)
    downButton.position = CGPoint(x: size.width * 0.20, y: size.height * 0.15)
    addChild(downButton)
  }
}
