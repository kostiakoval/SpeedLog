//
//  Colors.swift
//  SpeedLog
//
//  Created by Kostiantyn Koval on 23/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

import Foundation

/// RGBColorType representation
protocol RGBColorType {

  /// Return RGB color represenation.
  /// Example R: 200, G: 125, G: 255
  var colorCode: String { get }
}

struct ColorLog {
  struct Key {
    private static let Escape = "\u{001b}["
    private static let Fg = "fg"
    static let Bg = "bg"

    static let StartFg = "\(Escape)\(Fg)"
    static let StartBg = "\(Escape)\(Bg)"

    static let ResetFG = Escape + "fg;" // Clear any foreground color
    static let ResetBG = Escape + "bg;" // Clear any background color
    static let Reset   = Escape + ";"   // Clear any foreground or background color
  }

  /// String with a Font color
  static func font<T>(color: RGBColorType, object: T) -> String {
     return "\(Key.StartFg)\(color.colorCode);\(object)\(Key.Reset)"
  }

  /// String with a Background color
  static func background<T>(color: RGBColorType, object: T) -> String {
    return "\(Key.StartBg)\(color.colorCode);\(object)\(Key.Reset)"
  }

  /// String with both Background and Font color
  static func colored<T>(font: RGBColorType, background: RGBColorType, object: T) -> String {
    let string =
      "\(Key.Escape)fg\(font.colorCode);" +
      "\(Key.Escape)bg\(background.colorCode);" +
      "\(object)\(Key.Reset)"

    return string
  }
}
