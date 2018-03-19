//
//  HomeViewController.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/6.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit
import CRRefresh


class HomeViewController: BaseViewController {
    @IBOutlet weak var cycleView: ZCycleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        title = "主页"
        setupCycleView()
    }
    

    /// 设置轮播图
    fileprivate func setupCycleView() {
        
//        cycleView.placeholderImage = #imageLiteral(resourceName: "placeholder")
        cycleView.setUrlsGroup(["http://t.cn/RYVfQep","http://t.cn/RYVfgeI","http://t.cn/RYVfsLo","http://t.cn/RYMuvvn","http://t.cn/RYVfnEO","http://t.cn/RYVf1fd"])
        cycleView.pageControlItemSize = CGSize(width: 8, height: 8)
        cycleView.pageControlItemRadius = 0
        cycleView.pageControlAlignment = .right
        cycleView.pageControlItemRadius = 4
        view.addSubview(cycleView)
    }
}
