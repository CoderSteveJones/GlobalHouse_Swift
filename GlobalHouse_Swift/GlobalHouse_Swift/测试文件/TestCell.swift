//
//  TestCell.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/16.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit

class TestCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var name: String? {
        
        didSet {
            nameLabel.text = name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


class Person: NSObject {
    
    let name: String
    let age: Int
    
    init(name: String,age: Int) {
        self.name = name
        self.age = age
    }
    
    convenience init(name: String) {
        self.init(name: name, age: 10)
    }
}




/// 自定义view
class MyView: UIView {
    
    fileprivate var b: String
    
    
    override init(frame: CGRect) {
        
        b = "123"
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

