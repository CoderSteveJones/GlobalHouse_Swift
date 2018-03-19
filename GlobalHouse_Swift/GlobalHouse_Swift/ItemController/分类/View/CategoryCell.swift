//
//  CategoryCell.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/19.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    
    @IBOutlet weak var categoryLabel: UILabel!
    fileprivate var borderLayer: CALayer? // 边框
    fileprivate var borderX: CGFloat = 99
    fileprivate var borderW: CGFloat = 0.5
    
    
    /// 赋值
    var category: DeviceCategory? {
        
        didSet {
            categoryLabel.text = category?.name
            categoryLabel.textColor = (category?.isSelected)! ? UIColor.red : UIColor.darkText
            backgroundColor = (category?.isSelected)! ? UIColor.clear : UIColor.white
            borderLayer?.isHidden = (category?.isSelected)!
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        borderLayer = CALayer()
        borderLayer?.frame = CGRect(x: borderX, y: 0, width: borderW, height: contentView.frame.size.height + 2)
        borderLayer?.backgroundColor = UIColor.lightGray.cgColor
        contentView.layer.addSublayer(borderLayer!)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
