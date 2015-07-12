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
    logExamples()

    return true
  }
  
  func logExamples() {
    //V1
    /*for i in 0...100 {
    let a = i * 2
    println(a)
    } */
    
    //V2
    /*func printNums() {
    for i in 0...100 {
    let a = i * 2
    println(a)
    }
    }*/
    
    //V3
    func printNums() {
      for i in 0...100 {
        let a = i * 2
        #if DEBUG
          println(a)
        #endif
      }
    }
    
    //V4
    
    func speedPrintNums() {
      for i in 0...100 {
        let a = i * 2
        SpeedLog.println(a)
        // SpeedLog.print(a)
      }
    }
    
    
    //SpeedLog.mode = LogMode.FileName | LogMode.FuncName | LogMode.Line
    SpeedLog.mode = LogMode.AllOptions
    
    //printNums()
    speedPrintNums()
  }
}

