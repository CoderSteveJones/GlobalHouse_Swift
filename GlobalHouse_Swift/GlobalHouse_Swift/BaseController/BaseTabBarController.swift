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
        setupChildVC(vc: homeVC, title: "主页", imageName: "", selectedImageName: "")
        let manageVC = ManageViewController()
        setupChildVC(vc: manageVC, title: "管理", imageName: "", selectedImageName: "")
        let modelVC = ModelViewController()
        setupChildVC(vc: modelVC, title: "模式", imageName: "", selectedImageName: "")
        let myVC = MyViewController()
        setupChildVC(vc: myVC, title: "我的", imageName: "", selectedImageName: "")
        
    }
    
    
    func setupChildVC(vc: BaseViewController,title: String,imageName: String,selectedImageName: String)  {
        
        // nav
        let baseNav = BaseNavController(rootViewController: vc)
        baseNav.tabBarItem.title = title
        
        // 图片
        var img = UIImage(named: imageName)
        img = img?.withRenderingMode(.alwaysOriginal)
        baseNav.tabBarItem.image = img
        
        // 选中时图片
        var selectedImg = UIImage(named: selectedImageName)
        selectedImg = selectedImg?.withRenderingMode(.alwaysOriginal)
        baseNav.tabBarItem.selectedImage = selectedImg
        
        // title富文本
        let attr = [NSAttributedStringKey.foregroundColor : UIColor.red,
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
