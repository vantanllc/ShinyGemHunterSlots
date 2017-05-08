//
//  GameViewController.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/6/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
  
  // MARK: Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    gameScene = createGameScene(size: view.bounds.size)
    if let skView = view as? SKView {
      presentGameSceneInDevMode(gameScene: gameScene, intoSKView: skView)
    }
  }
  
  override func viewDidLayoutSubviews() {
    if gameScene.size != view.bounds.size {
      gameScene.size = view.bounds.size
    }
  }
  
  // MARK: Config
  override var shouldAutorotate: Bool {
    return true
  }
  
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    return .portrait
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  // MARK: Properties
  var gameScene: GameScene!
}
