//
//  ShopcartViewController.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/19.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit

class ShopcartViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var allSelectedBtn: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate let cellID = "cellID"
    fileprivate let headerID = "headerID"
    fileprivate lazy var allData = [GHShopCart]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "购物车"
        setupTableView()
        
        setupData()
        tableView.reloadData()
    }
    

    @IBAction func allSelectedClick(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        for shopCart in allData {
            shopCart.storeSelected = sender.isSelected
            for goods in shopCart.goodses {
                goods.goodsSelected = shopCart.storeSelected
            }
        }
        tableView.reloadData()
    }
    
    fileprivate func setupData() {
        for index in 0..<4 {
            
            let goods1 = GHGoods()
            goods1.goodsName = "小猫\(index)"
            let goods2 = GHGoods()
            goods2.goodsName = "小狗\(index)"
            let setGoodses = [goods1, goods2]
            
            let store = GHStore()
            store.name = "店家\(index)"
            
            let shopCart = GHShopCart()
            shopCart.goodses = setGoodses
            shopCart.store = store
            
            allData.append(shopCart)
        }
    }
}

extension ShopcartViewController {
    
    fileprivate func setupTableView() {
    
        tableView.register(UINib.init(nibName: "ShopCartCell", bundle: nil), forCellReuseIdentifier: cellID)
        tableView.register(UINib.init(nibName: "ShopCartHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: headerID)
        
        tableView.mj_header = GHRunningHeader(refreshingBlock: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: { [weak self] in
                self?.tableView.mj_header.endRefreshing()
            })
        })
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return allData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let shopCart = allData[section]
        return shopCart.goodses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ShopCartCell
        
        let shopCart = allData[indexPath.section]
        cell.shopCart = shopCart
        
        let goodses = shopCart.goodses
        cell.goodes = goodses[indexPath.row]
        
        
        cell.cutClick = { shopCart in
            
        }
        
        cell.addClick = { shopCart in
            
        }
        
        // cell选中按钮点击
        cell.goodesSelectedClick = { [weak self](shopCart,goods) in
            goods.goodsSelected = !goods.goodsSelected
            var storeSelectedStatus = true // 默认选中
            for goods in shopCart.goodses{
                if !goods.goodsSelected { // 遍历 有一个没选中 就是没选中
                    storeSelectedStatus = false
                }
            }
            shopCart.storeSelected = storeSelectedStatus
            tableView.reloadData()
            
            self?.setupAllSelectedBtnStatus()
        }
        
        
        return cell
    }
    
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as! ShopCartHeaderView
        let shopCart = allData[section]
        headerView.shopCart = shopCart
        
        // 头部选中按钮点击
        headerView.storeClick = { [weak self](shopCart) in
            
            shopCart.storeSelected = !shopCart.storeSelected
            for goods in shopCart.goodses {
                goods.goodsSelected = shopCart.storeSelected
            }
            self?.tableView.reloadData()
            
            self?.setupAllSelectedBtnStatus()
        }
        
        return headerView
    }

    
    /// // 根据店家选中按钮状态进行全选按钮状态修改
    fileprivate func setupAllSelectedBtnStatus() {
        
        var allSelectedStatus = true
        for shopCart in (self.allData) {
            if !shopCart.storeSelected {
                allSelectedStatus = false
            }
        }
        self.allSelectedBtn.isSelected = allSelectedStatus
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
}

extension ShopcartViewController {
    
    
    // 表进入编辑模式 且点击按钮时回调
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        let shopCart = allData[indexPath.section]
        if editingStyle == .delete { // 删除到时候调接口 删除成功 删除当前数据（不进行数据请求刷新表的操作）
            shopCart.goodses.remove(at: indexPath.row)
            if shopCart.goodses.count == 0 {
                allData.remove(at: indexPath.section)
                tableView.deleteSections([indexPath.section], with: .fade)
            }else {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }

    }
    
    /// 设置多种左滑操作
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let action1 = UITableViewRowAction(style: .normal, title: "haha") { (action1, indexPath) in
//            kPrint(item: "haha")
//        }
//        let action2 = UITableViewRowAction(style: .normal, title: "hahaha") { (action1, indexPath) in
//            kPrint(item: "hahaha")
//        }
//        let action3 = UITableViewRowAction(style: .normal, title: "heihei") { (action1, indexPath) in
//            kPrint(item: "heihei")
//        }
//        return [action1, action2, action3]
//    }
    
    // 设置删除title
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    
}


