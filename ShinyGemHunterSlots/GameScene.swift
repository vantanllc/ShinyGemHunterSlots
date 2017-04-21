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
    resultDisplay = SKLabelNode(text: "Press blue button!")
    resultDisplay.position = CGPoint(x: size.width * 0.5, y: size.height * 0.25)
    addChild(resultDisplay)
    let columns: [[Gem]] = [
      [.diamond, .ruby, .amethyst],
      [.diamond, .ruby, .amethyst],
      [.diamond, .ruby, .amethyst]
    ]
    slotGridEntity = SlotGridEntity(columns: columns)
    let node = slotGridEntity.component(ofType: RenderComponent.self)!.node
    node.position = CGPoint(x: size.width * 0.3, y: size.height * 0.75)
    addChild(node)
    
    let buttonFactory = ButtonFactory()
    pullHandleButton = buttonFactory.createButton(withIdentifier: .pullHandle)
    pullHandleButton.position = CGPoint(x: size.width * 0.5, y: size.height * 0.15)
    addChild(pullHandleButton)
    
    let upButton = buttonFactory.createButton(withIdentifier: .up)
    upButton.position = CGPoint(x: size.width * 0.80, y: size.height * 0.15)
    addChild(upButton)
    
    let downButton = buttonFactory.createButton(withIdentifier: .down)
    downButton.position = CGPoint(x: size.width * 0.20, y: size.height * 0.15)
    addChild(downButton)
    
    
    walletLabel = SKLabelNode(text: "Wallet: \(wallet)")
    walletLabel.position = CGPoint(x: size.width * 0.5, y: 0)
    addChild(walletLabel)
    
    currentBetLabel = SKLabelNode(text: "Bet: \(currentBet)")
    currentBetLabel.position = CGPoint(x: size.width * 0.5, y: size.height * 0.95)
    addChild(currentBetLabel)
  }
  
  func resetSlotGridEntity(withColumns columns: [[Gem]]) {
    let oldNode = slotGridEntity.component(ofType: RenderComponent.self)?.node
    oldNode?.removeFromParent()
    
    slotGridEntity = SlotGridEntity(columns: columns)
    let node = slotGridEntity.component(ofType: RenderComponent.self)!.node
    node.position = CGPoint(x: size.width * 0.20, y: size.height * 0.75)
    addChild(node)
  }
  
  // MARK: Properties
  var wallet: Int = 100 {
    didSet {
      walletLabel.text = "Wallet: \(wallet)"
    }
  }
  var walletLabel: SKLabelNode!
  var currentBet: Int = 1 {
    didSet {
      currentBetLabel.text = "Bet: \(currentBet)"
    }
  }
  var currentBetLabel: SKLabelNode!
  var slotGridEntity: SlotGridEntity!
  var slotsDisplay: SKLabelNode!
  var resultDisplay: SKLabelNode!
  var pullHandleButton: ButtonNode!
  var slotMachine = SlotMachine()
  weak var gameSceneDelegate: GameSceneDelegate?
}
