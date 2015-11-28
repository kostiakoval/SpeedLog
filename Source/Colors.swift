//
//  Colors.swift
//  SpeedLog
//
//  Created by Kostiantyn Koval on 23/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

import Foundation

protocol ColorType {
  var colorCode: String { get }
}



struct LogColors {
  struct Key {
    static let Escape = "\u{001b}["

    static let Fg = "fg"
    static let Bg = "bg"

    static let ResetFG = Escape + "fg;" // Clear any foreground color
    static let ResetBG = Escape + "bg;" // Clear any background color
    static let Reset   = Escape + ";"   // Clear any foreground or background color
  }

  static func font<T>(color: ColorType, object: T) -> String {
     return "\(Key.Escape)fg\(color.colorCode);\(object)\(Key.Reset)"
  }

  static func background<T>(color: ColorType, object: T) -> String {
    return "\(Key.Escape)bg\(color.colorCode);\(object)\(Key.Reset)"
  }

  static func colored<T>(font: ColorType, background: ColorType, object: T) -> String {

    let string =
      "\(Key.Escape)bg\(font.colorCode);" +
      "\(Key.Escape)bg\(background.colorCode);" +
      "\(object)\(Key.Reset)"

    return string
  }



/*
  static func red<T>(object: T) {
    print("\(ESCAPE)fg255,0,0;\(object)\(RESET)")
  }

  static func green<T>(object: T) {
    print("\(ESCAPE)fg0,255,0;\(object)\(RESET)")
  }

  static func blue<T>(object: T) {
    print("\(ESCAPE)fg0,0,255;\(object)\(RESET)")
  }

  static func yellow<T>(object: T) {
    print("\(ESCAPE)fg255,255,0;\(object)\(RESET)")
  }

  static func purple<T>(object: T) {
    print("\(ESCAPE)fg255,0,255;\(object)\(RESET)")
  }

  static func cyan<T>(object: T) {
    print("\(ESCAPE)fg0,255,255;\(object)\(RESET)")
  } */
}
