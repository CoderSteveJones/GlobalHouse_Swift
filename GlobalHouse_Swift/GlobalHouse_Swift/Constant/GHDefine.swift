//
//  GHDefine.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/6.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import Foundation

// 百度语音参数
let BDVoiceAppID = "10941493"
let BDVoiceApiKey = "VVzTACkmPRnZ91txRrL4nZbW"
let BDVoiceSecretKey = "71c77bc579eebb075854961bfe51544f"


// 微信APPID
let wxAppid = ""

// 高德地图KEY
let GDMapKey = "106e669758234d40912af11befd5c344"

// 屏幕的物理宽度
let kScreenW = UIScreen.main.bounds.size.width
// 屏幕的物理高度
let kScreenH = UIScreen.main.bounds.size.width


func kPrint(item: Any) {
    
    #if DEBUG
        print(item)
    #else
    
    #endif
}


/// 获取状态栏高度
///
/// - Returns: h
func getStatusBarH() -> CGFloat {
    return UIApplication.shared.statusBarFrame.size.height
}

/// 是否是IPHONEx
///
/// - Returns: yes or no
func isIPhoneX() -> Bool {
    return (kScreenW == 375 && kScreenH == 812)
}

/// 设置view最上边距离  最下边距离
///
/// - Parameters:
///   - viewTop: view离导航栏距离
///   - viewBottom: view离底部距离
func setTopMarginAndBottomMargin(viewTop: NSLayoutConstraint,viewBottom: NSLayoutConstraint) {
    viewTop.constant = isIPhoneX() ? 88 : 64;
    viewBottom.constant = isIPhoneX() ? 34 : 0;
}


/// 设置view圆角和边框
///
/// - Parameters:
///   - view: 被设置vie
///   - radius: 半径
///   - width: 边框宽度
///   - color: 边框颜色
func setViewBorderRadius(view: UIView,radius: CGFloat,width: CGFloat,color: UIColor){
    view.layer.cornerRadius = radius
    view.layer.masksToBounds = true
    view.layer.borderWidth = width
    view.layer.borderColor = color.cgColor
}



