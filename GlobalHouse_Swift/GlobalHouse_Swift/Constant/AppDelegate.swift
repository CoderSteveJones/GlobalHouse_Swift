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

        
        // 地图配置
        mapConfig()
        
        
        // 键盘配置
        configKeyBoard()
        
        // 推送配置
        configUMPush(launchOptions: launchOptions)
        
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
    
    /// 配置微信支付
    fileprivate func configWXPay(){
        
    }
    
    
    /// 高德地图配置
    fileprivate func mapConfig() {
        AMapServices.shared().apiKey = GDMapKey
    }
    
   
    /// 配置友盟推送
    fileprivate func configUMPush(launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        
        UMConfigure.initWithAppkey("", channel: "App Store")
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
        } else {
            // Fallback on earlier versions
        }
        let entity = UMessageRegisterEntity()
        entity.types = Int(UInt8(UMessageAuthorizationOptions.alert.rawValue) | UInt8(UMessageAuthorizationOptions.badge.rawValue) | UInt8(UMessageAuthorizationOptions.sound.rawValue))
        UMessage.registerForRemoteNotifications(launchOptions: launchOptions, entity: entity, completionHandler: { (granted, error) in
            
            if granted {
                // 用户选择了接收Push消息
            }else {
                // 用户拒绝接收Push消息
            }
            
        })
        
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
    

    /// 支付处理
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        handldAliPay(url: url)
        handldAliPay(url: url)
        return true
    }
    /******************************************** 友盟推送**************************/
    // iOS10以下使用这两个方法接收通知，
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        UMessage.setAutoAlert(false)
        if Int(UIDevice.current.systemVersion)! < 10 {
            completionHandler(UIBackgroundFetchResult.newData)
        }
        
    }
    
    //iOS10新增：处理前台收到通知的代理方法
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        let userInfo = notification.request.content.userInfo
        if notification.request.trigger is UNPushNotificationTrigger {
            //应用处于前台时的远程推送接受
            //关闭友盟自带的弹出框
            UMessage.setAutoAlert(false)
            //必须加这句代码
            UMessage.didReceiveRemoteNotification(userInfo)
        } else {
            //应用处于后台时的本地推送接受
        }
        //当应用处于前台时提示设置，需要哪个可以设置哪一个
        completionHandler(UNNotificationPresentationOptions(rawValue: UNNotificationPresentationOptions.RawValue(UInt8(UNNotificationPresentationOptions.sound.rawValue) | UInt8(UNNotificationPresentationOptions.badge.rawValue) | UInt8(UNNotificationPresentationOptions.alert.rawValue))))
    }
    
    
    //iOS10新增：处理后台点击通知的代理方法
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        if response.notification.request.trigger is UNPushNotificationTrigger {
            //应用处于前台时的远程推送接受
            //关闭友盟自带的弹出框
            UMessage.setAutoAlert(false)
            //必须加这句代码
            UMessage.didReceiveRemoteNotification(userInfo)
        } else {
            //应用处于后台时的本地推送接受
        }
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
