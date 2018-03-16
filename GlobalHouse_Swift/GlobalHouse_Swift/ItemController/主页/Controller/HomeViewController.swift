//
//  HomeViewController.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/6.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit
import CRRefresh


class HomeViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        title = "主页"
        
        tableView.cr.addHeadRefresh(animator: FastAnimator()) { [weak self] in
             DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
                self?.tableView.cr.endHeaderRefresh()
            })
        }
       
        tableView.cr.beginHeaderRefresh()
        
        tableView.cr.addFootRefresh(animator: NormalFooterAnimator()) {
            [weak self] in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
//                /// If no more data
//                self?.tableView.cr.noticeNoMoreData()
                /// Reset no more data
//                self?.tableView.cr.resetNoMore()
                self?.tableView.cr.endLoadingMore()
            })
        }
        
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
        
        let vc = TestChildViewController()
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    

}
