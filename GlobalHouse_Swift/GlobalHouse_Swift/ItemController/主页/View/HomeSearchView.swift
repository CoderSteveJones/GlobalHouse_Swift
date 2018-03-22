//
//  HomeSearchView.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/21.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit

class HomeSearchView: UIView {

    
    @IBOutlet weak var searchBtn: UIButton!
    var searchBtnClick: (() -> Void)? // 搜索
    var scanBtnClick: (() -> Void)? // 扫描
    
    @IBAction func scanBtnClick(_ sender: Any) {
        if scanBtnClick != nil {
            scanBtnClick!()
        }
    }
    
    @IBAction func searchBtnClick(_ sender: Any) {
        if searchBtnClick != nil {
            searchBtnClick!()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setViewBorderRadius(view: self.searchBtn, radius: 5, width: 0, color: UIColor.clear)
    }

}
