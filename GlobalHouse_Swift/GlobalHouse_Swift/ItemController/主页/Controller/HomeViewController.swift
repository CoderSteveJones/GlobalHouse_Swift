//
//  HomeViewController.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/6.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit
import Alamofire
//import Kingfisher
//import AlamofireObjectMapper

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        let url = "http://139.196.36.167:8084/h5Server/v1/Shop/getMerchants"
        let par = [ "merchantProperty" : "1",
                    "page" : "1",
                    "rows" : "10"]
        
//        Alamofire.request(url, method: .post, parameters: par, encoding: JSONEncoding.default, headers: nil).
        
        
        
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
