//
//  AppDelegate.swift
//  Nomiaruki_App
//
//  Created by 酒好き@荒川&和田 on 2015/08/25.
//  Copyright (c) 2015年 alancodvo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private var window: UIWindow?
    private var myTabBarController: UITabBarController!
    
    /*
    アプリケーション起動時に呼ばれるメソッド.
    */
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // Tabに設定するViewControllerのインスタンスを生成.
        let myFirstTab: UIViewController = FirstViewController()
        let mySecondTab: UIViewController = SecondViewController()
        let myThirdTab: UIViewController = ThirdViewController()
        let myFourthTab: UIViewController = FourthViewController()
        
        // タブを要素に持つArrayの.を作成する.
        let myTabs = NSArray(objects: myFirstTab, mySecondTab, myThirdTab, myFourthTab)
        
        // UITabControllerの作成する.
        myTabBarController = UITabBarController()
        
        // ViewControllerを設定する.
        myTabBarController?.setViewControllers(myTabs as [AnyObject], animated: false)
        
        // RootViewControllerに設定する.
        self.window!.rootViewController = myTabBarController
        
        self.window!.makeKeyAndVisible()
        
        return true
    }
}

