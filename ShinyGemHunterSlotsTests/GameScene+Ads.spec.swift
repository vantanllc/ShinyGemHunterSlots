//
//  GameScene+Ads.spec.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 7/31/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

import Quick
import Nimble
@testable import ShinyGemHunterSlots

class GameSceneAdsSpec: QuickSpec {
  override func spec() {
    describe("GameScene+Ads") {
      var scene: GameScene!
      var mockUserDefaults: MockUserDefaults!
      
      beforeEach {
        mockUserDefaults = MockUserDefaults()
        mockUserDefaults.set(true, forKey: UserDefaultsService.Keys.didReceiveInitialWalletCash)
        let userDefaultsService = UserDefaultsService(userDefaults: mockUserDefaults)
        scene = GameScene(size: CGSize(),
                          randomSource: GKRandomSource(),
                          userDefaultsService: userDefaultsService)
      }
      
      context("did viewed ads") {
        it("should get credits to wallet") {
          let previousWallet: Int = scene.wallet
          let expectedWallet: Int = previousWallet + GameScene.Config.watchAdsCredit
          scene.didFinishViewingAds()
          expect(scene.wallet).to(equal(expectedWallet))
        }
      }
    }
  }
}
