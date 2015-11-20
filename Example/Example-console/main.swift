//
//  main.swift
//  Example-console
//
//  Created by Kostiantyn Koval on 20/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

import Foundation

SpeedLog.print("Hello")

SpeedLog.mode = .AllOptions
SpeedLog.print("Enable All Features")

SpeedLog.mode = .FuncName
SpeedLog.print("Show only FunctionName")

SpeedLog.mode = [.FuncName, .FileName]
SpeedLog.print("Show FunctionName and File name")

SpeedLog.mode = [.FuncName, .FileName, .Line]
SpeedLog.print("Show all 3 options :)")

