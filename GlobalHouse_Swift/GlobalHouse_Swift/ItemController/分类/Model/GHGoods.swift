//
//  GHGoods.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/20.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit
import HandyJSON

class GHGoods: HandyJSON {

    var image: String = ""
    var goodsName: String = ""
    
    var goodsSelected = false // 购物车中被选择状态
    
    
    required init() {}
}
