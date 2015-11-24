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

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
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
    SpeedLog.print("Show all 3 options :)")
  }

  func colorLog() {
    let c = UIColor.redColor()
    print("Original:", c)

    UIColor.swizzleDesription()
    print("Swizzleed:", c)

    UIColor.undoDesriptionSwizzling()
    print("Original Restored:", c)
  }
}

