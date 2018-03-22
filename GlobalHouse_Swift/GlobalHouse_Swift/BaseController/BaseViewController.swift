//
//  BaseViewController.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/6.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViewController()
    }

    override func rt_customBackItem(withTarget target: Any!, action: Selector!) -> UIBarButtonItem! {
        let back = UIBarButtonItem(title: "返回", style: .plain, target: target, action: action)
        return back
    }
    
    
    func setupViewController() {
        navigationController?.navigationBar.barTintColor = UIColor.init(hexString: "#ec5527")
    }

}
