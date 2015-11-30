//
//  SpeedLog+UIColor.swift
//  SpeedLog
//
//  Created by Kostiantyn Koval on 30/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

import Foundation

// MARK: - Color Log
public extension SpeedLog {

  /// Use custom UIColor desription
  static func enableVisualColorLog() {
    UIColor.swizzleDescription()
  }

  /// Restore default UIColor desription
  static func disableVisualColorLog() {
    UIColor.undoDesriptionSwizzling()
  }
}

