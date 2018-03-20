//
//  CategoryViewController.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/19.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit

class CategoryViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate lazy var firstReload = true // 第一次加载
    fileprivate lazy var categorys = [DeviceCategory]()
    
    fileprivate lazy var categoryCellID = "categoryCellID"
    fileprivate lazy var goodsCellID = "goodsCellID"
    fileprivate lazy var pageIndex = 1
    fileprivate lazy var pageSize = 10
    fileprivate var currentCategory: DeviceCategory?
    fileprivate lazy var goods = [GHGoods?]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "分类"
        setupTableView()
        setupCollectionView()
        loadDataForCategory()
        
    }
}

extension CategoryViewController {
    
    
    /// 设置tableView
    fileprivate func setupTableView() {
        
        tableView.register(UINib.init(nibName: "CategoryCell", bundle: nil), forCellReuseIdentifier: categoryCellID)
    
    }
    
    
    /// 设置collectionView
    fileprivate func setupCollectionView() {
        
        collectionView.register(UINib.init(nibName: "GoodsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: goodsCellID)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 60, height: 90)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        collectionView.collectionViewLayout = layout
    
        
        
        collectionView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            [weak self] in
            
            if let weakSelf = self {
                weakSelf.loadDataForGoodlist(isMore: false)
            }
        })
        
        collectionView.mj_footer = MJRefreshBackStateFooter.init(refreshingBlock: {
            [weak self] in
            
            if let weakSelf = self {
                weakSelf.loadDataForGoodlist(isMore: true)
            }
        })
    }
    
    
    /// 分类获取
    fileprivate func loadDataForCategory() {
        
        NetworkRequest.sharedInstance.getRequest(urlString: getCategory, params: nil, success: { (response) in
            
            let code = response["code"] as! String
            if code == "0000" {
                let dataArr = response["data"] as! [Any]
                if let getCategorys = [DeviceCategory].deserialize(from: dataArr){
                    self.categorys = getCategorys as! [DeviceCategory]
                    self.tableView.reloadData()
                    self.tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false,scrollPosition: .top)
                    self.currentCategory = self.categorys[0]
                    
                    // 拿到第一个类别加载商品数据
                    self.collectionView.mj_header.beginRefreshing()
                }
            }else {
                SVProgressHUD.doAnyRemind(withHUDMessage: response["message"] as! String, withDuration: 1.5)
            }
            
        }) { (error) in
            SVProgressHUD.doAnythingFailed(withHUDMessage: error.localizedDescription, withDuration: 1.5)
        }
    }
    
    fileprivate func loadDataForGoodlist(isMore: Bool) {
        
        var par = [String : Any]()
        if isMore {
            pageIndex += 1
            par = ["pageIndex" : pageIndex,
                   "pageSize": 10,
                 "classNo" : (self.currentCategory?.value)!]
        }else {
            pageIndex = 1
            par = ["pageIndex" : pageIndex,
                       "pageSize": 10,
                       "classNo" : (self.currentCategory?.value)!]
            self.goods.removeAll()
        }
        NetworkRequest.sharedInstance.getRequest(urlString: getGoodLsit, params: par, success: { (response) in
            
            self.collectionView.mj_header.endRefreshing()
            self.collectionView.mj_footer.endRefreshing()
            
            let code = response["code"] as! String
            if code == "0000" {
                let dataArr = response["data"] as! [Any]
                if let getGoods = [GHGoods].deserialize(from: dataArr){
                    self.goods += getGoods
                    self.collectionView.reloadData()
                    if getGoods.count < 10 {
                        self.collectionView.mj_footer.endRefreshingWithNoMoreData()
                    }
                }
            }else {
                SVProgressHUD.doAnyRemind(withHUDMessage: response["message"] as! String, withDuration: 1.5)
            }
            
        }) { (error) in
            
            self.collectionView.mj_header.endRefreshing()
            self.collectionView.mj_footer.endRefreshing()
            SVProgressHUD.doAnythingFailed(withHUDMessage: error.localizedDescription, withDuration: 1.5)
        }
    }
}

extension CategoryViewController {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.goods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: goodsCellID, for: indexPath) as! GoodsCollectionViewCell
        cell.goods = self.goods[indexPath.row]
        return cell
    }
    
}

extension CategoryViewController {
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categorys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: categoryCellID, for: indexPath) as! CategoryCell
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
        
        // 点击显示其他类别商品
        self.currentCategory = currentCategory
        loadDataForGoodlist(isMore: false)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        let lastCategory = categorys[indexPath.row]
        lastCategory.isSelected = false
        if let lastCell = tableView.cellForRow(at: indexPath) as? CategoryCell {
            lastCell.category = lastCategory
        }
    }
}
