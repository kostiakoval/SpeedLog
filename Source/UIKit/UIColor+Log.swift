//
//  UIColor+Log.swift
//  SpeedLog
//
//  Created by Kostiantyn Koval on 23/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

import UIKit

// MARK: - Decription Swizzling
extension UIColor {

  /// Swizzle description method with own colorDescription.
  /// colorDescription will used instead of description
  class func swizzleDescription() {
    let instance = UIColor.red
    instance.swizzleMethods(#selector(getter: NSObjectProtocol.description), withSelector: #selector(UIColor.colorDescription))
  }

  /// Restore back original description method
  class func undoDesriptionSwizzling() {
    let instance = UIColor.red
    instance.swizzleMethods(#selector(UIColor.colorDescription), withSelector: #selector(getter: NSObjectProtocol.description))
  }
}

// MARK: - RGGColor
public struct RGBColor {
  let R: Int
  let G: Int
  let B: Int
}

extension RGBColor: CustomStringConvertible {
  public var description: String {
    return "RGB: \(R), \(G), \(B)"
  }
}

extension RGBColor: RGBColorType {
  //Color representation for XcodeColors console log
  var colorCode: String {
    return "\(R),\(G),\(B)"
  }
}

// MARK: - UIColor
extension UIColor {

  var rgbColor: RGBColor {
    var red:   CGFloat = 0
    var green: CGFloat = 0
    var blue:  CGFloat = 0
    var alpha: CGFloat = 0

    getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    return RGBColor(R: Int(red * 255), G: Int(green * 255), B: Int(blue * 255))
  }

  func colorDescription() -> String {
    let color = rgbColor
    return "\(color) - " + ColorLog.background(color, object: " ")
  }
}




