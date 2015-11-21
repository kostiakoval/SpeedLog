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
    XCTAssertEqual(prefix, "[\(10)]: ")
  }
}

// MARK: - Helpers
extension SpeedLogTests {

  func logForMode(mode: LogMode) -> String {
    SpeedLog.mode = mode
    return SpeedLog.printStringForMode("File", function: "FuncA", line: 10)
  }
}


