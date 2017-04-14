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
    slotsDisplay = SKLabelNode(text: "Play to win!")
    slotsDisplay.position = CGPoint(x: size.width * 0.5, y: size.height * 0.75)
    addChild(slotsDisplay)
    
    resultDisplay = SKLabelNode(text: "Press blue button!")
    resultDisplay.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
    addChild(resultDisplay)
    
    let buttonFactory = ButtonFactory()
    pullHandleButton = buttonFactory.createButton(withIdentifier: .pullHandle)
    pullHandleButton.position = CGPoint(x: size.width * 0.5, y: size.height * 0.25)
    addChild(pullHandleButton)
  }
  
  // MARK: Properties
  var slotsDisplay: SKLabelNode!
  var resultDisplay: SKLabelNode!
  var pullHandleButton: ButtonNode!
  var slotMachine = SlotMachine()
  weak var gameSceneDelegate: GameSceneDelegate?
}
