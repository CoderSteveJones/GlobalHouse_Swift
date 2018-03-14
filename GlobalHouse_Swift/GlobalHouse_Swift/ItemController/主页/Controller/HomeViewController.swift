//
//  HomeViewController.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/6.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        title = "主页"
        
        let urlStr = "http://192.168.2.162:6060/User"
        let par = ["action" : "getUserDeviceList",
                   "userId" : "5e54613846b647fa81301785282b5c46",
                     "page" : "1",
                 "pageSize" : "10"]
        
//        NetworkRequest.sharedInstance.postRequest(urlString: urlStr, params: par, success: { (response) in
//            let str = response["code"] as! String
//            if str == "0000" {
//                let dataArr = response["data"] as! [Any]
//                if let devices = [Device].deserialize(from: dataArr){
//                    if let device = devices[0] {
//                        print(device.showName)
//                    }
//                }
//
//            }
//        }) { (error) in
//            SVProgressHUD.showError(withStatus: error.localizedDescription)
//        }
        
        
        NetworkRequest.sharedInstance.getRequest(urlString: urlStr, params: par, success: { (response) in
            let str = response["code"] as! String
            if str == "0000" {
                let dataArr = response["data"] as! [Any]
                if let devices = [Device].deserialize(from: dataArr){
                    if let device = devices[0] {
                        print(device.showName)
                    }
                }
            }else {
                
            }
        }) { (error) in
            SVProgressHUD.showError(withStatus: error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
