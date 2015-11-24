//
//  Swizzling.swift
//  SpeedLog
//
//  Created by Kostiantyn Koval on 24/11/15.
//  Copyright © 2015 Kostiantyn Koval. All rights reserved.
//

import Foundation

extension NSObject {

  class func swizzleMethods(origSelector: Selector, withSelector: Selector, forClass: AnyClass) {
    let originalMethod = class_getInstanceMethod(forClass, origSelector)
    let swizzledMethod = class_getInstanceMethod(forClass, withSelector)

    method_exchangeImplementations(originalMethod, swizzledMethod)
  }

  func swizzleMethods(origSelector: Selector, withSelector: Selector) {
    let aClass: AnyClass! = object_getClass(self)
    NSObject.swizzleMethods(origSelector, withSelector: withSelector, forClass: aClass)
  }
}
