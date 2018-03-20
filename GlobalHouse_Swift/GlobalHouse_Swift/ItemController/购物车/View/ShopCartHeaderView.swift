//
//  ShopCartHeaderView.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/20.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit

class ShopCartHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var clickBtn: UIButton!
    @IBOutlet weak var shopNameLabel: UILabel!
    
    
    @IBAction func clickBtnClick(_ sender: Any) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = UIColor.red
    }
}
