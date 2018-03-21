//
//  HomeViewController.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/6.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    fileprivate lazy var first = ["净水系统","智能家控系统","热水系统","强效净水系统","更多系统"]
    fileprivate lazy var second = ["净水系统","智能家控系统","热水系统",
                                   "净水系统","智能家控系统","热水系统",
                                   "净水系统","智能家控系统","热水系统"]
    fileprivate lazy var thirds = ["净水系统","智能家控系统","热水系统","净水系统"]
    fileprivate lazy var fourth = ["净水系统","智能家控系统","热水系统","净水系统",
                                   "净水系统","智能家控系统","热水系统","净水系统"]
    fileprivate lazy var fifth = ["净水系统","智能家控系统","热水系统","净水系统",
                                  "净水系统","智能家控系统"]
    fileprivate lazy var allArrs = [first,second,thirds,fourth,fifth]
    
    
    fileprivate let hSCellID = "HomeSystemCellID"
    fileprivate let cMCellID = "ConventionalMaterialsCellID"
    fileprivate let qMCellID = "QuickMaterialCellID"
    fileprivate let rMCellID = "RecommendeMaterialCellID"
    fileprivate let ftCell = "FavoriteCellID"
    fileprivate let firstGHID = "GHFirstReusableView"
    fileprivate let otherGHID = "GHReusableViewID"
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        title = "主页"
        setupCollectionView()
        
        
        collectionView.mj_header = GHRunningHeader(refreshingBlock: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: { [weak self] in
                self?.collectionView.mj_header.endRefreshing()
            })
        })
        
    }
}

extension HomeViewController {
    
    fileprivate func setupCollectionView() {
        
        // 注册头部视图
        self.collectionView.register(UINib.init(nibName: "GHReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: otherGHID)
        self.collectionView.register(UINib.init(nibName: "GHFirstReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: firstGHID)
        
        // 注册cell
        self.collectionView.register(UINib.init(nibName: "HomeSystemCell", bundle: nil), forCellWithReuseIdentifier: hSCellID)
        self.collectionView.register(UINib.init(nibName: "ConventionalMaterialsCell", bundle: nil), forCellWithReuseIdentifier: cMCellID)
        self.collectionView.register(UINib.init(nibName: "QuickMaterialCell", bundle: nil), forCellWithReuseIdentifier: qMCellID)
        self.collectionView.register(UINib.init(nibName: "RecommendeMaterialCell", bundle: nil), forCellWithReuseIdentifier: rMCellID)
        self.collectionView.register(UINib.init(nibName: "FavoriteCell", bundle: nil), forCellWithReuseIdentifier: ftCell)
    }
    
}

extension HomeViewController {
    
    // MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return allArrs.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let titles = allArrs[section]
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: hSCellID, for: indexPath) as! HomeSystemCell
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cMCellID, for: indexPath) as! ConventionalMaterialsCell
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: qMCellID, for: indexPath) as! QuickMaterialCell
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: rMCellID, for: indexPath) as! RecommendeMaterialCell
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ftCell, for: indexPath) as! FavoriteCell
            return cell
        default:
            break
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if indexPath.section == 0 {
            let firstHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: firstGHID, for: indexPath) as! GHFirstReusableView
            return firstHeaderView
        }
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: otherGHID, for: indexPath) as! GHReusableView
        return headerView
    }
    
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: 60, height: 90)
        case 1:
            return CGSize(width: (kScreenW - CGFloat(4)) / 3.0, height: 44) // 4 为左右边距 2 * 2（间隙个数）
        case 2:
            return CGSize(width: (kScreenW - CGFloat(4)) / 2.0, height: 100)
        case 3:
            return CGSize(width: (kScreenW - CGFloat(6)) / 4.0, height: 44)
        case 4:
            return CGSize(width: (kScreenW - CGFloat(10)) / 2.0, height: 270)
        default:
            break
        }
        return CGSize.zero
    }
    
    // 左右行之间的距离
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            
            let allW = 60.0 * 5
            let allMargin = 10.0 * 2
            let m = (kScreenW - CGFloat(allW) - CGFloat(allMargin)) / 4.0
            return m / 2.0
            
        case 1:
            return 2
        case 2:
            return 2
        case 3:
            return 2
        case 4:
            return 10
        default:
            break
        }
        return 0
    }
    
    // 上下行之间的距离
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            return 10
        case 1:
            return 2
        case 2:
            return 2
        case 3:
            return 2
        case 4:
            return 10
        default:
            break
        }
        return 0
    }
    
    // 设置区头
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 0 {
            return CGSize(width: kScreenW, height: 200)
        }
        return CGSize(width: kScreenW, height: 44)
    }
    
    // 设置内容内边距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        switch section {
        case 0:
            return UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10)
        case 1:
            return UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        case 2:
            return UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        case 3:
            return UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        case 4:
            return UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        default:
            
            break
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}
