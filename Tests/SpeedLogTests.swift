//
//  SpeedLogTests.swift
//  SpeedLogTests
//
//  Created by Kostiantyn Koval on 20/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

import XCTest
@testable import SpeedLog

class SpeedLogTests: XCTestCase {

  func testEmptyPrefix() {
    let prefix = logForMode(.None)
    XCTAssertEqual(prefix, "")
  }

  func testFilePrefix() {
    let prefix = logForMode(.FileName)
    XCTAssertEqual(prefix, "File.: ")
    //FIXME: remove "." from string
  }

  func testFuncPrefix() {
    let prefix = logForMode(.FuncName)
    XCTAssertEqual(prefix, "FuncA: ")
  }

  func testLinePrefix() {
    let prefix = logForMode(.Line)
    XCTAssertEqual(prefix, "[10]: ")
  }

  func testDatePrefix() {
    let prefix = logForMode(.Date)
    XCTAssertEqual(prefix, "2015-01-10 06:44:43.060: ")
  }

  func testFullCodeLocationPrefix() {
    let prefix = logForMode(.FullCodeLocation)
    XCTAssertEqual(prefix, "File.FuncA[10]: ")
  }

  func testAllOptionsPrefix() {
    let prefix = logForMode(.AllOptions)
    XCTAssertEqual(prefix, "2015-01-10 06:44:43.060 File.FuncA[10]: ")
    //FIXME: add space between date and file
  }
}

// MARK: - Helpers
extension SpeedLogTests {

  func logForMode(_ mode: LogMode) -> String {
    SpeedLog.mode = mode
    return SpeedLog.modePrefix(date, file:"File", function: "FuncA", line: 10)
  }

  var date: Date {
    var components = DateComponents()
    components.year = 2015
    components.month = 1
    components.day = 10

    components.hour = 6
    components.minute = 44
    components.second = 43
    components.nanosecond = 60000000 //100000 NSEC_PER_SEC

    return Calendar.current.date(from: components)!
  }
}


