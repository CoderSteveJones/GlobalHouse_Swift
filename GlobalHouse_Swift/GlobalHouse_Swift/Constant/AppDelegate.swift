//
//  AppDelegate.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/6.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let tabbarController = BaseTabBarController()
        let rootVC = RTRootNavigationController(rootViewControllerNoWrapping: tabbarController)
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        
        
        // 测试代码
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.rootViewController = ViewController()
//        window?.makeKeyAndVisible()
        
        // 百度语音测试代码
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.rootViewController = BDVoiceRecViewController()
//        window?.makeKeyAndVisible()
        
        // 协议测试代码
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.rootViewController = ProtocolTestViewController()
//        window?.makeKeyAndVisible()

        
        // 键盘配置
        configKeyBoard()
        
        return true
    }

    /// 键盘配置
    fileprivate func configKeyBoard() {
        
        let mgr = IQKeyboardManager.sharedManager()
        mgr.enable = true
        mgr.shouldResignOnTouchOutside = true
        mgr.enableAutoToolbar = false
        mgr.shouldToolbarUsesTextFieldTintColor = true
    }
    
    fileprivate func configWXPay(){
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        handldAliPay(url: url)
        handldAliPay(url: url)
        return true
    }
    
}

extension AppDelegate {
    
    // 支付宝回调
    fileprivate func handldAliPay(url: URL) {
        if url.host == "safepay" {
            AlipaySDK.defaultService().processOrder(withPaymentResult: url, standbyCallback: { (result) in
                if let getResult = result {
                    kPrint(item: getResult)
                }
            })
        }
    }
    
    // 微信支付回调
    fileprivate func handWXPay(url: URL) {
        WXApi.handleOpen(url, delegate: WXApiManager.shared())
    }
    
}
