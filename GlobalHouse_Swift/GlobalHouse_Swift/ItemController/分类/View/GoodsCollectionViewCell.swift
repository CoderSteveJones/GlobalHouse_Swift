//
//  GoodsCollectionViewCell.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/20.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit

class GoodsCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var goodsImage: UIImageView!
    @IBOutlet weak var goodsNameLabel: UILabel!
    
    var goods: GHGoods? {
        didSet {
            let url = URL(string: (goods?.image)!)
            goodsImage.kf.setImage(with: url)
            goodsNameLabel.text = goods?.goodsName
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
