//
//  CGFloat+Extras.swift
//  ShinyGemHunterSlots
//
//  Created by Thinh Luong on 7/15/17.
//  Copyright © 2017 Vantan LLC. All rights reserved.
//

import SpriteKit

func >(lhs: CGFloat, rhs: CGFloat) -> Bool {
  return rhs.isLess(than: lhs)
}
