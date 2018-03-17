//
//  ProtocolView.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/16.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit

@objc protocol ProtocolDelegate {
    
    /// 可选方法
    @objc optional func send()
    
    /// 必选方法
    func sendData()
}


class ProtocolView: UIView {

    var delegate: ProtocolDelegate?
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBAction func Click(_ sender: Any) {
        
        if delegate != nil {
            delegate?.send!()
            delegate?.sendData()
        }
    }
    
}
