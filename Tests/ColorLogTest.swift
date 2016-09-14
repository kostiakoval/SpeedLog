//
//  ColorLogTest.swift
//  SpeedLog
//
//  Created by Kostiantyn Koval on 28/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

import XCTest
@testable import SpeedLog

class ColorLogTest: XCTestCase {
    let redRGB = UIColor.red.rgbColor

   func testFont() {
    let redString = ColorLog.font(redRGB, object: "Hi")
    XCTAssertEqual(redString, "\(ColorLog.Key.StartFg)\(redRGB.colorCode);Hi\(ColorLog.Key.Reset)")
  }

  func testBackground() {
    let redBgString = ColorLog.background(redRGB, object: "Hi")
    XCTAssertEqual(redBgString, "\(ColorLog.Key.StartBg)\(redRGB.colorCode);Hi\(ColorLog.Key.Reset)")
  }

  func testColored() {
    let redBgString = ColorLog.colored(redRGB, background: redRGB, object: "Hi")

    let expecred =
    "\(ColorLog.Key.StartFg)\(redRGB.colorCode);" +
    "\(ColorLog.Key.StartBg)\(redRGB.colorCode);" +
    "Hi\(ColorLog.Key.Reset)"

    XCTAssertEqual(redBgString, expecred)
  }

}
