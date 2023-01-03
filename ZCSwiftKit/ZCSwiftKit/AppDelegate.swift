//
//  AppDelegate.swift
//  ZCSwiftKit
//
//  Created by zjy on 2022/12/16.
//

import UIKit

@main

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let window: UIWindow = UIWindow.init(frame: UIScreen.main.bounds)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let nav1 = UINavigationController.init(rootViewController: ZCRootVC0.init())
        nav1.tabBarItem = .init(tabBarSystemItem: .search, tag: 0)
        let nav2 = UINavigationController.init(rootViewController: ZCRootVC1.init())
        nav2.tabBarItem = .init(tabBarSystemItem: .history, tag: 1)
        let nav3 = UINavigationController.init(rootViewController: ZCRootVC2.init())
        nav3.tabBarItem = .init(tabBarSystemItem: .bookmarks, tag: 2)
        let tab = UITabBarController.init()
        tab.viewControllers = [nav1, nav2, nav3]
        window.backgroundColor = UIColor.white
        window.rootViewController = tab
        window.makeKeyAndVisible()
        
        return true
    }
    
}

