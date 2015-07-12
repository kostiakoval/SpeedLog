//
//  main.swift
//  Example
//
//  Created by Kostiantyn Koval on 09/07/15.
//  Copyright (c) 2015 Kostiantyn Koval. All rights reserved.
//

import Foundation

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
    SpeedLog.print(a)
  }
}



//printNums()
speedPrintNums()
