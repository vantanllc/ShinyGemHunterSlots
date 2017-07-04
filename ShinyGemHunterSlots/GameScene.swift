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
  init(size: CGSize, randomSource: GKRandomSource) {
    sharedRandom = randomSource
    super.init(size: size)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func sceneDidLoad() {
    loadStateMachine()
    addLabels()
    addButtons()
    slotMachine = SlotMachine(randomSource: sharedRandom)
    addSlotGrid()
  }
  
  override func didMove(to view: SKView) {
    stateMachine.enter(GameSceneActiveState.self)
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
  
  var stateMachine: GKStateMachine!
  let sharedRandom: GKRandomSource
}

extension GameScene {
  struct Config {
    static let winningMultiplier: Int = 5
  }
  
  struct Label {
    static let fontSize: CGFloat = 70
  }
}

extension GameScene {
  func loadStateMachine() {
    let states: [GKState] = [
      GameSceneActiveState(gameScene: self),
    ]
    stateMachine = GKStateMachine(states: states)
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
      let winnings = currentBet * Config.winningMultiplier
      wallet += winnings
      resultDisplay.text = "YOU WON \(winnings)! YAY!!!"
    } else {
      wallet -= currentBet
      resultDisplay.text = "YOU LOST \(currentBet)! BOO!!!"
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
    currentBetLabel.position = CGPoint(x: xPosition, y: size.height * 0.95)
    currentBetLabel.fontSize = Label.fontSize
    addChild(currentBetLabel)
    
    walletLabel = SKLabelNode(text: "Wallet: \(wallet)")
    walletLabel.position = CGPoint(x: xPosition, y: 0)
    walletLabel.fontSize = Label.fontSize
    addChild(walletLabel)
    
    resultDisplay = SKLabelNode(text: "Press button to play!")
    resultDisplay.position = CGPoint(x: xPosition, y: size.height * 0.25)
    resultDisplay.fontSize = Label.fontSize
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
