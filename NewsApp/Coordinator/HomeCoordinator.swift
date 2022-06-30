//
//  HomeCoordinator.swift
//  NewsApp
//
//  Created by Muhammad Affan on 30/6/22.
//

import UIKit

final class HomeCoordinator: Coordinator {
    
    let window: UIWindow?
    
    var navigationController = UINavigationController()
    
    var screenStack: [Screenable] = []
    
    var onCompleted: ((ScreenResult?) -> Void)?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let screens = [HomeScreen(())]
        
        set(screens)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func showScreen(identifier: String, navigation: Navigation) {
        
    }
    
}
