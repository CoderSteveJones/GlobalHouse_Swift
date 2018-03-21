//
//  ShopCartCell.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/20.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit

class ShopCartCell: UITableViewCell {

    @IBOutlet weak var clickBtn: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var goodNameLabel: UILabel!
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var cutBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var countTxf: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setViewBorderRadius(view: cutBtn, radius: 2, width: 0.5, color: UIColor.lightGray)
        setViewBorderRadius(view: addBtn, radius: 2, width: 0.5, color: UIColor.lightGray)
        setViewBorderRadius(view: countTxf, radius: 0, width: 0.5, color: UIColor.lightGray)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func clickBtnClick(_ sender: Any) {
        
    }
    
    
    @IBAction func cutBtnClick(_ sender: Any) {
        
    }
    
    @IBAction func addBtnClick(_ sender: Any) {
        
    }
    
    
    
}
