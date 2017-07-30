//
//  GameViewController+GameScene.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/6/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

extension GameViewController {
  func createGameScene(size: CGSize, scaleMode: SKSceneScaleMode = .resizeFill) -> GameScene {
    let userDefaultsService = UserDefaultsService(userDefaults: UserDefaults.standard)
    let gameScene = GameScene(size: size,
                              randomSource: GKRandomSource.sharedRandom(),
                              userDefaultsService: userDefaultsService)
    gameScene.scaleMode = scaleMode
    return gameScene
  }

  func presentGameSceneInDevMode(gameScene: GameScene, intoSKView skView: SKView) {
    skView.presentScene(gameScene)
    skView.ignoresSiblingOrder = true
    skView.showsFPS = true
    skView.showsNodeCount = true
    skView.showsPhysics = true
  }
}
