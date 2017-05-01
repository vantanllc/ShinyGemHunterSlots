//
//  GemComponent.spec.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 4/30/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

import Quick
import Nimble
@testable import ShinyGemHunterSlots

class GemComponentSpec: QuickSpec {
  override func spec() {
    describe("GemComponent") {
      var gemComponent: GemComponent!
      let gem: Gem = .amethyst
      
      beforeEach {
        gemComponent = GemComponent(gem: gem)
      }
      
      it("should have a gem") {
        expect(gemComponent.gem).to(equal(gem))
      }
    }
  }
}
