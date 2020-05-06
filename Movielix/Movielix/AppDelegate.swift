//
//  AppDelegate.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/6/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var coordinator: LaunchCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let navigationController = NavigationController()
        coordinator = LaunchCoordinator(navigationController: navigationController)
        window = UIWindow(frame: UIScreen.main.bounds)
        coordinator?.start()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

