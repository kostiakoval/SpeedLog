# SpeedLog - 🚀🐌  
[![CI Status](http://img.shields.io/travis/kostiakoval/SpeedLog.svg?style=flat)](https://travis-ci.org/kostiakoval/Mirror)
[![Version](https://img.shields.io/cocoapods/v/SpeedLog.svg?style=flat)](http://cocoapods.org/pods/SpeedLog)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/SpeedLog.svg?style=flat)](http://cocoapods.org/pods/SpeedLog)
[![Platform](https://img.shields.io/cocoapods/p/SpeedLog.svg?style=flat)](http://cocoapods.org/pods/SpeedLog)

**SpeedLog** - Fast Debug logging, easy to disable and improve Swift performance optimization  

The Swift `print` statements aren't emitted when compiling in Release mode with enabled optimization. This prevents Swift from performing optimal code optimization.  

The SpeedLog allows you to remove `print` when the logs are disabled. This allows Swift compiler to perform optimal code optimization and increase application performance.

## Features

- [x] Improves Swift code optimization
- [x] Easy to disable
- [x] Reach formatting 
- [x] Coloured console output
- [x] Custom `UIColor` representation 

## Usage

```swift
import SpeedLog
SpeedLog.print("Hello")
SpeedLog.print(["Super"], ["Speed"])
```

### Log output Styling

```swift
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
```
### UIColor log
`SpeedLog` has nice `UIColor` log style.  
All you need to do is enable it once by calling `SpeedLog.enableVisualColorLog()`  

![](/Images/RGB-colors-log.png)  

```swift
SpeedLog.enableVisualColorLog()
SpeedLog.print("Visual:", c)

SpeedLog.disableVisualColorLog()
SpeedLog.print("Original Restored:", c)
```
P.S - You also need to install [XcodeColors](https://github.com/robbiehanson/XcodeColors) Xcode Plugin. Use [Alcatraz](http://alcatraz.io) to install it.

###Enables Log

To enables logs you need to add a Swift Compiler `ENABLE_LOG` flag   

1. Go to: Build Settings -> Swift Compiler - Custom Flags  
2. Add `-D ENABLE_LOG` flag   

If you use use `CocoaPods` or `Carthage` you need to enable it for `SpeedLog` framework, not the project itself.  

See more details at [Stackoverflow](http://stackoverflow.com/a/24112024/1838875)

## Installation
###[CocoaPods](http://cocoapods.org)

To install it, simply add the following line to your Podfile:

```ruby
use_frameworks!
pod "SpeedLog"
```

###[Carthage](https://github.com/Carthage/Carthage)

To integrate SpeedLog into your Xcode project using Carthage, specify it in your Cartfile:

```
github "kostiakoval/SpeedLog"
```
**`*`** Carthage builds frameworks in `Release` mode. This mean if you run `carthage update` and include `SpeedLog.framework` to the project no output will be printed to console, because it's not printed in release mode.  

**How to use Carthage with SpeedLog**: 
 
 - Run`carthage checkout`
 - Open `Carthage/Checkouts/SpeedLog` and add `SpeedLog.xcodeproj` to your project.

### Manual

Copy the `SpeedLog.swift` file into your project

### Colors

In order to use colorised console you need to install [XcodeColors](https://github.com/robbiehanson/XcodeColors) Xcode plugin.  
Use [Alcatraz](http://alcatraz.io) to install it. Go to:  
Xcode -> Window -> Package Manager -> Search for `XcodeColors` and install it


## Future Features
There are many logging libs I like:

- [PrintlnMagic](https://github.com/ArtSabintsev/PrintlnMagic)
- [Swell](https://github.com/hubertr/Swell)
- [CleanroomLogger](https://github.com/emaloney/CleanroomLogger)

But there is one problem with all of them - it's not possible to disable them before compiling Swift code.  

Next step is:  
 Get the best features from those libs and integrate them into `SpeedLog`

### To Do:

- [ ] Different log levels (debug, info, verbose,  etc)
- [ ] Log to a file
- [ ] Lazy code evaluation (@autoclosure) for log


## Contribute

Please open an issue with bugs and missing features, functionality or ideas for improvements.  
Also you can contribute by following these guidelines:

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create pull request

## Author

[Kostiantyn Koval](http://twitter.com/kostiakoval), thats me :)  

Thanks to [Arthur Ariel Sabintsev](https://github.com/ArtSabintsev) for his [PrintlnMagic](https://github.com/ArtSabintsev/PrintlnMagic) lib  


## License

SpeedLog is available under the MIT license. See the LICENSE file for more info.
