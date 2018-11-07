//
//  AppDelegate.swift
//  TabBarsReloj
//
//  Created by IGNACIO OLAGORTA VERA on 7/11/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow (frame: UIScreen.main.bounds)
        if let window = window {
        
            let worldclockVC = WorldClockViewController()
            let bedtimeVC = BedtimeViewController()
            let alarmVC = AlarmViewController()
            let stopwatchVC = StopwatchViewController()
            let timerVC = TimerViewController()
        
            let tabController = UITabBarController()
            
            UITabBar.appearance().barTintColor = UIColor.black
            UITabBar.appearance().tintColor = UIColor(red: 1, green: 0.5, blue: 0, alpha: 1)
            UINavigationBar.appearance().barTintColor = UIColor.black
           
            
            let worldclockNavigationController = UINavigationController(rootViewController: worldclockVC)
            let alarmNavigationController = UINavigationController(rootViewController: alarmVC)
            let bedtimeNavigationController = UINavigationController(rootViewController: bedtimeVC)
            let stopwatchNavigationController = UINavigationController(rootViewController: stopwatchVC)
            let timerNavigationController = UINavigationController(rootViewController: timerVC)
           
            let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
            worldclockNavigationController.navigationBar.titleTextAttributes = textAttributes
            alarmNavigationController.navigationBar.titleTextAttributes = textAttributes
            bedtimeNavigationController.navigationBar.titleTextAttributes = textAttributes
            stopwatchNavigationController.navigationBar.titleTextAttributes = textAttributes
            timerNavigationController.navigationBar.titleTextAttributes = textAttributes
            
            
            tabController.viewControllers = [worldclockNavigationController,alarmNavigationController,bedtimeNavigationController,stopwatchNavigationController,timerNavigationController]
            window.rootViewController = tabController
            window.makeKeyAndVisible()
        }
        
        return true
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


}

