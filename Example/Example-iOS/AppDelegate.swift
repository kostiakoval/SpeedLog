//
//  AppDelegate.swift
//  SpeedLogExample
//
//  Created by Kostiantyn Koval on 12/07/15.
//  Copyright (c) 2015 Kostiantyn Koval. All rights reserved.
//

import UIKit
import SpeedLog

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    myFunc()
    colorLog()
    return true
  }

  func myFunc() {
    SpeedLog.print("Hello")

    SpeedLog.mode = .AllOptions
    SpeedLog.print("Enable All Features")

    SpeedLog.mode = .FuncName
    SpeedLog.print("Show only FunctionName")

    SpeedLog.mode = [.FuncName, .FileName]
    SpeedLog.print("Show FunctionName and File name")

    SpeedLog.mode = [.FuncName, .FileName, .Line]
    SpeedLog.print("Show 3 options :)")

    SpeedLog.mode = .FullCodeLocation
    SpeedLog.print("Show fullCode, same as above")

    SpeedLog.mode = [.Date, .FuncName, .FileName, .Line]
    SpeedLog.print("Show all 3 options :)")
  }

  func colorLog() {
    SpeedLog.mode = .None
    SpeedLog.print("\nNice UIColor :) \n")
    let c = UIColor.red
    print("Original:", c)

    SpeedLog.enableVisualColorLog()
    SpeedLog.print("Visual:", c)

    SpeedLog.disableVisualColorLog()
    SpeedLog.print("Original Restored:", c)
  }
}

