//
//  AppDelegate.swift
//  NewsApp
//
//  Created by Muhammad Affan on 29/6/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let windowFrame = UIScreen.main.bounds
        self.window = UIWindow(frame: windowFrame)
        self.window?.makeKeyAndVisible()
        
        let coordinator = HomeCoordinator(window: window)
        coordinator.start()
        
        return true
    }

}
