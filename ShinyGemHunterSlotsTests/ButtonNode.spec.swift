//
//  ButtonNode.spec.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 5/6/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import GameplayKit

import Quick
import Nimble
@testable import ShinyGemHunterSlots

class ButtonNodeSpec: QuickSpec {
  override func spec() {
    describe("ButtonNode") {
      var button: ButtonNode!
      
      beforeEach {
        button = ButtonNode()
      }
      
      context("has name") {
        it("should have a buttonIdentifier") {
          button.name = ButtonIdentifier.pullHandle.rawValue
          expect(button.buttonIdentifier).to(equal(ButtonIdentifier.pullHandle))
          
        }
      }
      
      context("no name") {
        it("should not have buttonIdentifier") {
          expect(button.buttonIdentifier).to(beNil())
        }
      }
      
      context("scene does not conform to ButtonRespondable") {
        it("should have nil responder") {
          let scene = SKScene()
          scene.addChild(button)
          expect(button.responder).to(beNil())
        }
      }
      
      context("scene conforms to ButtonRespondable") {
        var scene: SceneExtendsButtonRespondable!
        beforeEach {
          scene = SceneExtendsButtonRespondable()
          scene.addChild(button)
        }
        
        it("should have responder") {
          expect(button.responder).to(be(scene))
        }
        
        context("isUserInteractionEnabled is enabled") {
          it("should call buttonTriggered") {
            button.isUserInteractionEnabled = true
            button.buttonTriggered()
            expect(scene.buttonTriggeredCalled).to(beTrue())
          }
        }
        
        context("isUserInteractionEnabled is disabled") {
          it("should not call buttonTriggered") {
            button.isUserInteractionEnabled = false
            button.buttonTriggered()
            expect(scene.buttonTriggeredCalled).to(beFalse())
          }
        }
      }
    }
  }
  
  class SceneExtendsButtonRespondable: SKScene, ButtonRespondable {
    func buttonTriggered(button: ButtonNode) {
      buttonTriggeredCalled = true
    }
    
    var buttonTriggeredCalled = false
  }
}
