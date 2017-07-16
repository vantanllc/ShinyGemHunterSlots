//
//  Winnable.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 7/15/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import Foundation

@objc protocol Winnable: class {
  func didWin() -> Bool
}
