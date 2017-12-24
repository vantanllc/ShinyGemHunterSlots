//
//  GameViewController.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/6/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import UIKit
import GameplayKit
import GoogleMobileAds

class GameViewController: UIViewController {
  // MARK: Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()

    interstitial = AdBuilder.getInterstitial(withDelegate: self)
    GADRewardBasedVideoAd.sharedInstance().delegate = self

    gameScene = createGameScene(size: view.bounds.size, withAdDelegate: self)
    if let skView = view as? SKView {
      gameScene.backgroundColor = .gray
      presentGameSceneInDevMode(gameScene: gameScene, intoSKView: skView)
    }
  }

  override func viewDidLayoutSubviews() {
    if gameScene.size != view.bounds.size {
      gameScene.size = view.bounds.size
    }
  }

  // MARK: Properties
  var gameScene: GameScene!
  var interstitial: GADInterstitial!
}
