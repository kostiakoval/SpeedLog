//
//  SpeedLog.swift
//  Pods
//
//  Created by Kostiantyn Koval on 08/07/15.
//
//

import Foundation

typealias SLog = SpeedLog

///LogMode type. Specify what details should be included to the log
public struct LogMode : OptionSetType {

  private var value: UInt = 0
  public var rawValue: UInt { return value }

  public init(rawValue value: UInt)  { self.value = value }
  public init(_ value: UInt)         { self.value = value }

  //MARK:- Options
  public static var None     = LogMode(rawValue: 0)
  public static var FileName = LogMode(rawValue: 1 << 0)
  public static var FuncName = LogMode(rawValue: 1 << 1)
  public static var Line     = LogMode(rawValue: 1 << 2)

  /// AllOptions - Enable all options, [FileName, FuncName, Line]
  public static var AllOptions: LogMode = [FileName, FuncName, Line]
}


///SpeedLog Type
public struct SpeedLog {
  /// Log Mode
  public static var mode: LogMode = .None

  /**
   print items to the console

   - parameter items:      items to print
   - parameter separator:  separator between items. Default is space" "
   - parameter terminator: a character inserted at the end of output.
   */

  public static func print(items: Any..., separator: String = " ", terminator: String = "\n", _ file: String = __FILE__, _ function: String = __FUNCTION__, _ line: Int = __LINE__) {
    #if !DISABLE_LOG
      let prefix = modePrefix(file, function: function, line: line)
      let stringItem = items.map {"\($0)"} .joinWithSeparator(separator)
      Swift.print("\(prefix)\(stringItem)", terminator: terminator)
    #endif
  }
}

extension SpeedLog {

  /**
   Creates an output string for the currect log Mode
  */
  static func modePrefix(file: String, function: String, line: Int) -> String {
    var result: String = ""
    if mode.contains(.FileName) {
      let filename = file.lastPathComponent.stringByDeletingPathExtension
      result = "\(filename)."
    }
    if mode.contains(.FuncName) {
      result += "\(function)"
    }
    if mode.contains(.Line) {
      result += "[\(line)]"
    }

    if !result.isEmpty {
      result += ": "
    }

    return result
  }
}

/// String syntax sugar extension
extension String {
    var ns: NSString {
        return self as NSString
    }
    var lastPathComponent: String {
        return ns.lastPathComponent
    }
    var stringByDeletingPathExtension: String {
        return ns.stringByDeletingPathExtension
    }
}
