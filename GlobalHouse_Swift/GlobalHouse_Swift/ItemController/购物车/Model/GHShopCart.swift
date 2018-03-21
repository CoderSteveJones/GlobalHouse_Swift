//
//  GHShopCart.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/21.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit

class GHShopCart: NSObject {

    var store: GHStore?
    var goodses = [GHGoods]()
    
    var storeSelected = false // 店家被选择状态
}
