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
  
  override func didChangeSize(_ oldSize: CGSize) {
    super.didChangeSize(oldSize)
    if UIDevice.current.orientation.isLandscape {
      presentInLandscapeMode()
    }
    
    if UIDevice.current.orientation.isPortrait {
      presentInProtraitMode()
    }
  }
  
  // MARK: Properties
  var wallet: Int = 100 {
    didSet {
      walletLabel.text = "Wallet: \(wallet)"
    }
    willSet {
      if newValue == 0 {
        stateMachine.enter(GameSceneIdleState.self)
      }
      if newValue < currentBet {
        currentBet = newValue
      }
    }
  }
  var currentBet: Int = 1 {
    didSet {
      currentBetLabel.text = "Bet: \(currentBet)"
    }
  }
  // MARK: Timing
  var lastUpdateTime: TimeInterval = 0
  
  var walletLabel: TLLabelNode!
  var currentBetLabel: TLLabelNode!
  var resultDisplay: TLLabelNode!
  var slotMachine: SlotMachine!
  var slotGridEntity: SlotGridEntity!
  
  var stateMachine: GKStateMachine!
  let sharedRandom: GKRandomSource
  
  var upButton: ButtonNode!
  var downButton: ButtonNode!
  var pullHandleButton: ButtonNode!
}

extension GameScene {
  struct Config {
    static let winningMultiplier: Int = 5
  }
  
  struct Label {
    static let fontSize: CGFloat = 70
  }
}

// MARK: Update
extension GameScene {
  override func update(_ currentTime: TimeInterval) {
    super.update(currentTime)
    
    if lastUpdateTime.isZero {
      lastUpdateTime = currentTime
    }
    
    let deltaTime = currentTime - lastUpdateTime
    lastUpdateTime = currentTime
    
    stateMachine.update(deltaTime: deltaTime)
  }
}

extension GameScene {
  func loadStateMachine() {
    let states: [GKState] = [
      GameSceneActiveState(gameScene: self),
      GameSceneIdleState(gameScene: self),
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
    if UIDevice.current.orientation.isPortrait {
      node.position = CGPoint(x: size.width * 0.25, y: size.height * 0.80)
    } else {
      node.position = CGPoint(x: size.width * 0.3, y: size.height * 0.80)
    }
    addChild(node)
  }
  
  func addLabels() {
    let xPosition = size.width * 0.5
    
    currentBetLabel = TLLabelNode(text: "Bet: \(currentBet)")
    currentBetLabel.position = CGPoint(x: size.width * 0.25, y: 0)
    addChild(currentBetLabel)
    
    walletLabel = TLLabelNode(text: "Wallet: \(wallet)")
    walletLabel.position = CGPoint(x: size.width * 0.75, y: 0)
    addChild(walletLabel)
    
    resultDisplay = TLLabelNode(text: "Press button to play!")
    resultDisplay.position = CGPoint(x: xPosition, y: size.height * 0.25)
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

fileprivate extension GameScene {
  func presentInProtraitMode() {
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
  
  func presentInLandscapeMode() {
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
