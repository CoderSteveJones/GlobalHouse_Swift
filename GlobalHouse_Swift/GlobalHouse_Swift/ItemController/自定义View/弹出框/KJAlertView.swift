//
//  KJAlertView.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/15.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit

class KJAlertView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var sureBtn: UIButton!
    
    private var cancel: (() -> ())?
    private var sure: (() -> ())?
    
    override func awakeFromNib() {
        setViewBorderRadius(view: contentView, radius: 5, width: 0, color: UIColor.clear)
        setViewBorderRadius(view: cancelBtn, radius: 5, width: 0, color: UIColor.clear)
        setViewBorderRadius(view: sureBtn, radius: 5, width: 0, color: UIColor.clear)
    }

    
    /// 创建view
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - cancelEvent: 取消操作
    ///   - sureEvent: 确定操作
    static func showAlertView(_ title: String,cancelEvent: @escaping ()->(),sureEvent: @escaping ()->()){
        
        let alertView = Bundle.main.loadNibNamed("KJAlertView", owner: self, options: nil)![0] as! KJAlertView
        alertView.titleLabel.text = title
        alertView.cancel = cancelEvent
        alertView.sure = sureEvent
        alertView.frame = UIScreen.main.bounds
        UIApplication.shared.keyWindow?.addSubview(alertView)
    
        /// 起始尺寸和透明度
        alertView.contentView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        alertView.alpha = 0
        
        let transform = CGAffineTransform(scaleX: 1, y: 1)
        
        /**
         *  usingSpringWithDamping：0-1 数值越小，弹簧振动效果越明显
         *  initialSpringVelocity ：数值越大，一开始移动速度越快
         */
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: UIViewAnimationOptions.curveLinear, animations: {
            
            alertView.contentView.transform = transform
            alertView.alpha = 1
            alertView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            
        }) { (finished) in
            
        }
        
    }
    
    
    /// 取消
    ///
    /// - Parameter sender: btn
    @IBAction func cancelBtnClick(_ sender: Any) {
        if cancel != nil {
            cancel!()
        }
        removeView()
    }
    
    
    /// 确定
    ///
    /// - Parameter sender: btn
    @IBAction func sureBtnClick(_ sender: Any) {
        if sure != nil {
            sure!()
        }
        removeView()
    }
    
    
    /// 移除view
    private func removeView() {
        
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.contentView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
            self.contentView.alpha = 0
            self.backgroundColor = UIColor.black.withAlphaComponent(0)
        }) { (finished) in
             self.removeFromSuperview()
        }
       
    }
}
