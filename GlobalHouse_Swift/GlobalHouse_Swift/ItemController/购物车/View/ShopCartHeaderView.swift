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
    
    var storeClick:((_ shopCart: GHShopCart) -> Void)!
    
    
    var shopCart: GHShopCart? {
        didSet {
            
            shopNameLabel.text = shopCart?.store?.name
            let imageName = (shopCart?.storeSelected)! ? "box_unchoose" : "box_choose"
            let btnImage = UIImage(named: imageName)
            clickBtn.setBackgroundImage(btnImage, for: .normal)
        }
    }
    
    
    @IBAction func clickBtnClick(_ sender: Any) {
        
        if storeClick != nil {
            storeClick!(shopCart!)
        }
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = UIColor.yellow
    }
}
