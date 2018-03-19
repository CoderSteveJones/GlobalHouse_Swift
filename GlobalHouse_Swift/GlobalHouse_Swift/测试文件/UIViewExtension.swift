//
//  UIViewExtension.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/16.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import Foundation

extension UIView {
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var r = self.frame
            r.origin.x = newValue
            self.frame = r
        }
    }
}
