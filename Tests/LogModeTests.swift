//
//  Test.swift
//  SpeedLog
//
//  Created by Kostiantyn Koval on 26/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

import XCTest
@testable import SpeedLog

class LogModeTests: XCTestCase {
  let allCases: [LogMode] = [.None, .FileName, .FuncName, .Line, .Date]

  func testAllCasesAreEven() {
    let allValues = allCases.map { $0.rawValue }
    let oddValues = allValues.filter { $0 % 2 != 0 }

    XCTAssertEqual(oddValues.count, 1)
    XCTAssertTrue(oddValues.first! == 1)
  }

  func testAllCasesAreUnique() {
    let rawValues = allCases.map {$0.rawValue }
    let uniqueValues = Set(rawValues)

    XCTAssertEqual(uniqueValues.count, rawValues.count)
  }

  func testAggregationCase() {
    XCTAssertEqual(LogMode.FullCodeLocation, [.FileName, .FuncName, .Line])
    XCTAssertEqual(LogMode.AllOptions, [.Date, .FileName, .FuncName, .Line])
  }
}
