//
//  ShopcartViewController.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/19.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit

class ShopcartViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    fileprivate let cellID = "cellID"
    fileprivate let headerID = "headerID"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "购物车"
        setupTableView()
        
    }
}

extension ShopcartViewController {
    
    fileprivate func setupTableView() {
    
        tableView.register(UINib.init(nibName: "ShopCartCell", bundle: nil), forCellReuseIdentifier: cellID)
        tableView.register(UINib.init(nibName: "ShopCartHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: headerID)
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ShopCartCell
        return cell
    }
    
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as! ShopCartHeaderView
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    
    
}
