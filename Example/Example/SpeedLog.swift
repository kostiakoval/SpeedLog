//
//  SpeedLog.swift
//  Pods
//
//  Created by Kostiantyn Koval on 08/07/15.
//
//

import Foundation

typealias SLog = SpeedLog

public struct LogMode : RawOptionSetType {
  
  private var value: UInt = 0
  
  public init(_ value: UInt)         { self.value = value }
  public init(rawValue value: UInt)  { self.value = value }
  public init(nilLiteral: ())        { self.value = 0 }
  
  public static var allZeros: LogMode { return self(0) }
  public var rawValue: UInt { return self.value }
  
  //MARK:- Options
  static var None: LogMode        { return self(0) }
  static var FileName: LogMode    { return self(1 << 0) }
  static var FuncName: LogMode    { return self(1 << 1) }
  static var Line: LogMode        { return self(1 << 2) }
  
  //Helper
  static var AllOptions: LogMode  { return FileName | FuncName | Line }
}

public struct SpeedLog {
  
  public static var mode: LogMode = LogMode.None
  
  public static func println<T>(object: T, _ file: String = __FILE__, _ function: String = __FUNCTION__, _ line: Int = __LINE__) {
    #if ENABLE_LOG
      let s = printStringForMode(object, file: file, function: function, line: line)
      Swift.println(s)
    #endif
  }
  
  public static func print<T>(object: T, _ file: String = __FILE__, _ function: String = __FUNCTION__, _ line: Int = __LINE__) {
    #if ENABLE_LOG
      let s = printStringForMode(object, file: file, function: function, line: line)
      Swift.print(s)
    #endif
  }
}

private extension SpeedLog {
  static func printStringForMode<T>(object: T, file: String, function: String, line: Int) -> String {
    var result: String = ""
    if mode & .FileName != nil {
      result = "\(file.lastPathComponent.stringByDeletingPathExtension)."
    }
    if mode & .FuncName != nil {
      result += "\(function)"
    }
    if mode & .Line != nil {
      result += "[\(line)]"
    }
    
    if !result.isEmpty {
      result += ": "
    }
    result += "\(object)"
    return result
  }
}
