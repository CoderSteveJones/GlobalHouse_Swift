//
//  AliPayViewController.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/17.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit

class AliPayViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /// 调用支付宝app支付
    @IBAction func aliPayClick(_ sender: Any) {
        
        /// 先上传商品信息 然后获取orderStr 调用下面的sdk
        /*
        let fromScheme = "GlobalHouse" // info Plist文件中修改
        AlipaySDK.defaultService().payOrder("", fromScheme: fromScheme) { (result) in
            if let getResult = result {
                DebugLog(item: getResult)
            }
        }
        */
    }
    
    
    @IBAction func wxPayClick(_ sender: Any) {
        
        /// 先上传商品信息 然后获取下列所需信息 调用下面的sdk
        /*
        let request = PayReq()
        request.partnerId = ""
        request.package = ""
        request.prepayId = ""
        request.nonceStr = ""
        request.timeStamp = 123
        request.sign = ""
        WXApi.send(request)
         */
    }
}
