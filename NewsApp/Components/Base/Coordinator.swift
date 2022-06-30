//
//  Coordinator.swift
//  NewsApp
//
//  Created by Muhammad Affan on 30/6/22.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var screenStack: [Screenable] { get set }
    
    func start()
    func showScreen(identifier: String, navigation: Navigation)
}

extension Coordinator {

    /// Sets the passed `screens` to this instance's `navigationController` and `screenStack`.
    func set(_ screens: [Screenable], animated: Bool = true) {

        let viewControllers: [ViewController] = screens.map({ screen -> ViewController in

            screen.event = { navigation in
                self.showScreen(
                    identifier: screen.identifier,
                    navigation: navigation
                )
            }

            return screen.build()
        })
        
        navigationController.setViewControllers(
            viewControllers,
            animated: animated
        )
    }

    /// Pops to the `screen` by it's identifier and remove from `screenStack`.
    /// If it's not available in current `screenStack`, it will do nothing.
    func pop(byIdentifier identifier: String? = nil, animated: Bool = true) {

        guard !screenStack.isEmpty else {
            return
        }

        var screenIndex: Int?
        
        if identifier == nil {
            /// Pops the latest screen from `navigationController` and remove from `screenStack`.
            screenStack.removeLast()
            
            navigationController.popViewController(animated: animated)
            return
        }

        screenStack.enumerated()
            .forEach({ index, screen in

                if screen.identifier == identifier {
                    screenIndex = index
                }
            })

        guard let index = screenIndex,
            !navigationController.viewControllers.isEmpty,
            (index >= navigationController.viewControllers.startIndex) && (index <= navigationController.viewControllers.endIndex) else {
                return
        }

        for numIndex in ((index + 1)..<screenStack.count).reversed() {
            screenStack.remove(at: numIndex)
        }

        let viewController: UIViewController = navigationController.viewControllers[index]

        navigationController.popToViewController(
            viewController,
            animated: animated
        )
    }
    
    /// Pushes the `screen` to this instance's `navigationController` and `screenStack`.
    func push(_ screen: Screenable, animated: Bool = true) {

        screen.event = { navigation in
            self.showScreen(
                identifier: screen.identifier,
                navigation: navigation
            )
        }

        screenStack.append(screen)

        let viewController = screen.build()
        
        navigationController.pushViewController(
            viewController,
            animated: animated
        )
    }
    
    func pushMultiple(_ screens: [Screenable], animated: Bool = true) {
        var viewControllers = navigationController.viewControllers
        screens.forEach { screen in
            screen.event = { navigation in
                self.showScreen(
                    identifier: screen.identifier,
                    navigation: navigation
                )
            }
            viewControllers.append(screen.build())
        }

        screenStack.append(contentsOf: screens)
        
        navigationController.setViewControllers(viewControllers, animated: animated)
    }

}
