//
//  UIColor+Log.swift
//  SpeedLog
//
//  Created by Kostiantyn Koval on 23/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

import UIKit

public extension UIColor {
  public class func swizzleDesription() {
    let instance: UIColor = UIColor.redColor()
    instance.swizzleMethods("description", withSelector: "colorDescription")
  }

  public class func undoDesriptionSwizzling() {
    let instance: UIColor = UIColor.redColor()
    instance.swizzleMethods("colorDescription", withSelector: "description")
  }
}

extension UIColor {

  var rgbColor: RGBColor {
    var red:   CGFloat = 0
    var green: CGFloat = 0
    var blue:  CGFloat = 0
    var alpha: CGFloat = 0

    getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    return RGBColor(R: Int(red) * 255, G: Int(green) * 255, B: Int(blue) * 255)
  }

  func colorDescription() -> String {
    let color = rgbColor
    return "\(color) - " + LogColors.background(color, object: " ")
  }
}




