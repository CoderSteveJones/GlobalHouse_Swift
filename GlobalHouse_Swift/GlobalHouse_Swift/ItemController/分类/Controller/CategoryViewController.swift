//
//  CategoryViewController.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/19.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit

class CategoryViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate lazy var firstReload = true
    fileprivate lazy var categorys = [DeviceCategory]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "分类"
        tableView.register(UINib.init(nibName: "CategoryCell", bundle: nil), forCellReuseIdentifier: "cellID")
//        tableView.layer.borderWidth = 0.5;
//        tableView.layer.borderColor = UIColor.lightGray.cgColor;

        let urlStr = "http://smartcat.fun/getAppHomeList"
        NetworkRequest.sharedInstance.getRequest(urlString: urlStr, params: nil, success: { (response) in
            
            let code = response["code"] as! String
            if code == "0000" {
                let dataArr = response["data"] as! [Any]
                if let getCategorys = [DeviceCategory].deserialize(from: dataArr){
                    self.categorys = getCategorys as! [DeviceCategory]
                    self.tableView.reloadData()
                    self.tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false,scrollPosition: .top)
                }
            }else {
                SVProgressHUD.doAnyRemind(withHUDMessage: response["message"] as! String, withDuration: 1.5)
            }
            
        }) { (error) in
            SVProgressHUD.doAnythingFailed(withHUDMessage: error.localizedDescription, withDuration: 1.5)
        }
    }
}


extension CategoryViewController {
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categorys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! CategoryCell
        if firstReload {
            let firstCategory = categorys[0]
            firstCategory.isSelected = true
            firstReload = false
        }
        let category = categorys[indexPath.row]
        cell.category = category
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currentCategory = categorys[indexPath.row]
        currentCategory.isSelected = true
        if let currentCell = tableView.cellForRow(at: indexPath) as? CategoryCell{
            currentCell.category = currentCategory
        }
        tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        let lastCategory = categorys[indexPath.row]
        lastCategory.isSelected = false
        if let lastCell = tableView.cellForRow(at: indexPath) as? CategoryCell {
            lastCell.category = lastCategory
        }
    }
}
