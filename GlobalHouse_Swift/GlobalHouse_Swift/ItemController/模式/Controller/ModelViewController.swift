//
//  ModelViewController.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/6.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit

class ModelViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate lazy var titleArrs = [["定时列表","联动列表","智能模式"],
                                   ["设备分组"],
                                   ["设备管理","位置管理"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "模式"
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return titleArrs.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let titles = titleArrs[section]
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "cellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: cellID)
        }
        let titles = titleArrs[indexPath.section]
        cell?.textLabel?.text = titles[indexPath.row]
        return cell!
    }

}
