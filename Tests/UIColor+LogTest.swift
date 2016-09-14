//
//  UIColor+LogTest.swift
//  SpeedLog
//
//  Created by Kostiantyn Koval on 30/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

import XCTest
@testable import SpeedLog

class UIColorLogTest: XCTestCase {

  func testColorCode() {
    let color = RGBColor(R: 200, G: 10, B: 25)
    XCTAssertEqual(color.colorCode, "200,10,25")
  }

  func testUIColorRgb() {
    let redRGB = UIColor.red.rgbColor
    XCTAssertEqual(redRGB.colorCode, "255,0,0")

    let purpleRGB = UIColor.purple.rgbColor
    XCTAssertEqual(purpleRGB.colorCode, "127,0,127")
  }
}
