//: Playground - noun: a place where people can play

import SpeedLog

print("A")
SpeedLog.print("A")

print("A", "B")
SpeedLog.print("A", "B")

print(["A", "B"])
SpeedLog.print(["A", "B"])

print(["A"], ["B"])
SpeedLog.print(["A"], ["B"])


print(["A"], ["B"], 123, ["C"])
SpeedLog.print(["A"], ["B"], 123, ["C"])

SpeedLog.print("Other testing")
SpeedLog.print("")
SpeedLog.print()

SpeedLog.print(["Super"], ["Speed"])

SpeedLog.print("A", "B", separator: "-")
SpeedLog.print("A", "B", terminator: "")
SpeedLog.print("A", "B")

SpeedLog.print("A", "B", separator: "-", terminator: "\n")
