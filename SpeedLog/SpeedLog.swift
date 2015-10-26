//
//  SpeedLog.swift
//  Pods
//
//  Created by Kostiantyn Koval on 08/07/15.
//
//

import Foundation

typealias SLog = SpeedLog

public struct LogMode : OptionSetType {
  
  private var value: UInt = 0
  
  public init(_ value: UInt)         { self.value = value }
  public init(rawValue value: UInt)  { self.value = value }
  public init(nilLiteral: ())        { self.value = 0 }
  
  public static var allZeros: LogMode { return self.init(0) }
  public var rawValue: UInt { return self.value }
  
  //MARK:- Options
  public static var None: LogMode        { return self.init(0) }
  public static var FileName: LogMode    { return self.init(1 << 0) }
  public static var FuncName: LogMode    { return self.init(1 << 1) }
  public static var Line: LogMode        { return self.init(1 << 2) }

//Helper
  public static var AllOptions: LogMode  { return [FileName, FuncName, Line] }
}

public struct SpeedLog {
  
  public static var mode: LogMode = LogMode.None
  
  public static func println<T>(object: T, _ file: String = __FILE__, _ function: String = __FUNCTION__, _ line: Int = __LINE__) {
    #if ENABLE_LOG
      let s = printStringForMode(object, file: file, function: function, line: line)
      Swift.print(s)
    #endif
  }
  
  public static func print<T>(object: T, _ file: String = __FILE__, _ function: String = __FUNCTION__, _ line: Int = __LINE__) {
    #if ENABLE_LOG
      let s = printStringForMode(object, file: file, function: function, line: line)
      Swift.print(s, terminator: "")
    #endif
  }
}

private extension SpeedLog {
  static func printStringForMode<T>(object: T, file: String, function: String, line: Int) -> String {
    var result: String = ""
    //print("\(filename).\(function)[\(line)]: \(object)")
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
    result += "\(object)"
    return result
  }
}

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
