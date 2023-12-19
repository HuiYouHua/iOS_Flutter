//
//  AppDelegate.swift
//  iOS_demo
//
//  Created by 华惠友 on 2023/12/14.
//

import UIKit
import FlutterPluginRegistrant
import Flutter

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var flutterEngine1: FlutterEngine!
    var flutterEngine2: FlutterEngine!
    var flutterEngine3: FlutterEngine!
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        
        flutterEngine1 = FlutterEngine.init(name: "my flutter engine1")
        flutterEngine1.run(withEntrypoint: "entryPointA")
        
        GeneratedPluginRegistrant.register(with: flutterEngine1)
        
        var v1 = MyFlutterViewController.init(engine: flutterEngine1, nibName: nil, bundle: nil)
        v1.view.backgroundColor = UIColor.red
        v1.tabBarItem.title = "tab1"
        
        var v2 = UIViewController()
        v2.view.backgroundColor = UIColor.blue
        v2.tabBarItem.title = "tab2"
        
        flutterEngine2 = FlutterEngine.init(name: "my flutter engine2")
        flutterEngine2.run(withEntrypoint: "entryPointB")
        
        GeneratedPluginRegistrant.register(with: flutterEngine2)
        
        var v3 = MyFlutterViewController.init(engine: flutterEngine2, nibName: nil, bundle: nil)
        v3.view.backgroundColor = UIColor.orange
        v3.tabBarItem.title = "tab3"
        
        
        flutterEngine3 = FlutterEngine.init(name: "my flutter engine3")
        flutterEngine3.run(withEntrypoint: "entryPointC")
        
        GeneratedPluginRegistrant.register(with: flutterEngine3)
        
        var v4 = MyFlutterViewController.init(engine: flutterEngine3, nibName: nil, bundle: nil)
        v4.view.backgroundColor = UIColor.orange
        v4.tabBarItem.title = "tab3"
        
        var tabController = UITabBarController()
        tabController.setViewControllers([v1, v2, v3, v4], animated: false)
        tabController.tabBar.backgroundColor = .white
        window?.rootViewController = tabController
        window?.makeKeyAndVisible()
        
        
        return true
    }

   


}

