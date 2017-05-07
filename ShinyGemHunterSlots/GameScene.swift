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
  struct Config {
    struct Label {
      static let fontSize: CGFloat = 70
    }
    
    static let winningMultiplier: Int = 5
  }
}

extension GameScene {
  func resetSlotGridEntity(withColumns columns: [[Gem]]) {
    let oldNode = slotGridEntity.component(ofType: RenderComponent.self)?.node
    oldNode?.removeFromParent()
    
    addSlotGrid()
  }
  
  func evaluateSlotReel() {
    if slotMachine.didWin() {
      let winning = currentBet * Config.winningMultiplier
      resultDisplay.text = "YOU WON \(winning)! YAY!!!"
      wallet += winning
    } else {
      resultDisplay.text = "YOU LOST \(currentBet)! BOO!!!"
      wallet -= currentBet
    }
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
    let xPosition = size.width * 0.5
    
    currentBetLabel = SKLabelNode(text: "Bet: \(currentBet)")
    currentBetLabel.fontSize = Config.Label.fontSize
    currentBetLabel.position = CGPoint(x: xPosition, y: size.height * 0.95)
    addChild(currentBetLabel)
    
    walletLabel = SKLabelNode(text: "Wallet: \(wallet)")
    walletLabel.fontSize = Config.Label.fontSize 
    walletLabel.position = CGPoint(x: xPosition, y: 0)
    addChild(walletLabel)
    
    resultDisplay = SKLabelNode(text: "Press button to play!")
    resultDisplay.fontSize = Config.Label.fontSize  
    resultDisplay.position = CGPoint(x: xPosition, y: size.height * 0.25)
    addChild(resultDisplay)
  }
  
  func addButtons() {
    let buttonFactory = ButtonFactory()
    
    let yPosition = size.height * 0.15
    
    let pullHandleButton = buttonFactory.createButton(withIdentifier: .pullHandle)
    pullHandleButton.position = CGPoint(x: size.width * 0.5, y: yPosition)
    addChild(pullHandleButton)
    
    let upButton = buttonFactory.createButton(withIdentifier: .up)
    upButton.anchorPoint = CGPoint(x: 1, y: 0.5)
    upButton.position = CGPoint(x: size.width, y: yPosition)
    addChild(upButton)
    
    let downButton = buttonFactory.createButton(withIdentifier: .down)
    downButton.anchorPoint = CGPoint(x: 0, y: 0.5)
    downButton.position = CGPoint(x: 0, y: yPosition)
    addChild(downButton)
  }
}
