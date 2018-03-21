//
//  GHRunningHeader.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/21.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit

class GHRunningHeader: MJRefreshGifHeader {

    override func prepare() {
        super.prepare()
        
        // 设置普通状态的动画图片
        var idleImages = [UIImage]()
        for i in -1..<4 {
            let imageName = "app_refresh_people_\(i)"
            let img = UIImage(named: imageName)
            idleImages.append(img!)
        }
        
        setImages(idleImages, for: .idle)
        
        // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
        var refreshingImages = [UIImage]()
        for i in 0..<4 {
            let imageName = "app_refresh_people_\(i)"
            let img = UIImage(named: imageName)
            refreshingImages.append(img!)
        }
        setImages(refreshingImages, for: .pulling)
        
        // 设置正在刷新状态的动画图片
        setImages(refreshingImages, for: .refreshing)
    }

}
