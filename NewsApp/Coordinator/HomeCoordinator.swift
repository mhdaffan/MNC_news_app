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
        switch identifier {
        case homeScreenIdentifier:
            configureHomeScreenNavigationEvent(navigation)
        default:
            break
        }
    }
    
    private func configureHomeScreenNavigationEvent(_ navigation: Navigation) {
        switch navigation {
        case .previous:
            pop()
        case .next(let value):
            if let result = value as? ArticleItemModel {
                push(ArticleDetailScreen(result))
            }
        }
    }
    
}
