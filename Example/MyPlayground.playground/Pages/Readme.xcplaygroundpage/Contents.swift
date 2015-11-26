//: [Previous](@previous)

import SpeedLog
SpeedLog.print("Hello")
SpeedLog.print(["Super"], ["Speed"])

// ### Log output Styling

SpeedLog.mode = .FuncName
SpeedLog.print("Show only FunctionName")
//myFunc(): Show only FunctionName

SpeedLog.mode = [.FuncName, .FileName]
SpeedLog.print("Show FunctionName and File name")
//AppDelegate.myFunc(): Show FunctionName and File name

SpeedLog.mode = [.FuncName, .FileName, .Line]
SpeedLog.print("Show all 3 options :)")
//AppDelegate.myFunc()[35]: Show all 3 options :)

SpeedLog.mode = .AllOptions
SpeedLog.print("Enable All Features")
//AppDelegate.myFunc()[26]: Enable All Features

//: [Next](@next)
