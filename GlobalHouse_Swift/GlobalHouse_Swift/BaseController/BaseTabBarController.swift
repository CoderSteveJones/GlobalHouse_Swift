//
//  BaseTabBarController.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/6.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let homeVC = HomeViewController()
        setupChildVC(vc: homeVC, title: "主页", imageName: "tabItem_home", selectedImageName: "tabItem_home_se")
        let categoryVC = CategoryViewController()
        setupChildVC(vc: categoryVC, title: "分类", imageName: "tabItem_fl", selectedImageName: "tabItem_fl_se")
        let discoverVC = DiscoverViewController()
        setupChildVC(vc: discoverVC, title: "发现", imageName: "tabItem_fx", selectedImageName: "tabItem_fx_se")
        let shopCartVC = ShopcartViewController()
        setupChildVC(vc: shopCartVC, title: "购物车", imageName: "tabItem_gwc", selectedImageName: "tabItem_gwc_se")
        let myVC = MyViewController()
        setupChildVC(vc: myVC, title: "我的", imageName: "tabItem_wd", selectedImageName: "tabItem_wd_se")
        
        // 设置tabbar的显示颜色
//        self.tabBar.barTintColor = UIColor.red
        
    }
    
    
    func setupChildVC(vc: BaseViewController,title: String,imageName: String,selectedImageName: String)  {
        
        // nav
        let baseNav = BaseNavController(rootViewController: vc)
        
        // title img selectedImg
        let img = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        let selectedImg = UIImage(named: selectedImageName)?.withRenderingMode(.alwaysOriginal)
        let tabBarItem = UITabBarItem(title: title, image: img, selectedImage: selectedImg)
        baseNav.tabBarItem = tabBarItem
        
        
        
        
        // title富文本
        let attr = [NSAttributedStringKey.foregroundColor : UIColor.init(hexString: "#ec5527"),
                    NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16.0)]
        
        baseNav.tabBarItem.setTitleTextAttributes(attr, for: .selected)
        addChildViewController(baseNav)
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
