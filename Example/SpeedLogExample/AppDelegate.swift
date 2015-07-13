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
    return true
  }

  func myFunc() {
    SpeedLog.println("Hello")
    
    SpeedLog.mode = LogMode.AllOptions
    SpeedLog.println("Enable All Features")
    
    SpeedLog.mode = LogMode.FuncName
    SpeedLog.println("Show only FunctionName")
    
    SpeedLog.mode = LogMode.FuncName | LogMode.FileName
    SpeedLog.println("Show FunctionName and File name")
    
    SpeedLog.mode = LogMode.FuncName | LogMode.FileName | LogMode.Line
    SpeedLog.println("Show all 3 options :)")
  }
}

