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
SpeedLog.print("Show 3 options :)")
//AppDelegate.myFunc()[36]: Show 3 options :)

SpeedLog.mode = .FullCodeLocation
SpeedLog.print("Show fullCode, same as above")
//AppDelegate.myFunc()[39]: Show fullCode, same as above

SpeedLog.mode = .AllOptions
SpeedLog.print("Enable All Features")
//2015-11-26 19:32:33.687 AppDelegate.myFunc()[27]: Enable All Features
