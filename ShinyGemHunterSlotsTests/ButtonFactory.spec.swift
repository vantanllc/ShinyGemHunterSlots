//
//  ButtonFactory.spec.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 5/6/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

import Quick
import Nimble
@testable import ShinyGemHunterSlots

class ButtonFactorySpec: QuickSpec {
  override func spec() {
    describe("ButtonFactory") {
      var factory: ButtonFactory!
      
      beforeEach {
        factory = ButtonFactory()
      }
      
      context("createButton") {
        var button: ButtonNode!
        var identifier: ButtonIdentifier!
        
        beforeEach {
          identifier = .pullHandle
          button = factory.createButton(withIdentifier: identifier)
        }
        
        it("should return ButtonNode") {
          expect(button).toNot(beNil())
        }
        
        it("should be user enabled") {
          expect(button.isUserInteractionEnabled).to(beTrue()
        }
        
        it("should be named with ButtonIdentifier.retry") {
          expect(button.name).to(equal(identifier.rawValue))
        }
        
        it("should have zPosition of .button") {
          expect(button.zPosition).to(equal(NodeZPosition.button))
        }
      }
    }
  }
}
