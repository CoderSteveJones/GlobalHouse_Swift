//
//  ViewController.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/6.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.white
        
    }
   
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "cellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = "\(indexPath.row)" + "行"
        return cell!
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        /// 自定义视图测试
        KJAlertView.showAlertView("确定出现吗？", cancelEvent: {
            
            print("取消")
        }) {
            print("确定")
        }
    }
    
    
    
    /// 网络测试
    func newWorkTets() {
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


}

