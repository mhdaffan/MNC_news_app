//
//  NavigationEvent.swift
//  NewsApp
//
//  Created by Muhammad Affan on 30/6/22.
//

import UIKit

internal enum Navigation {
    case previous(ScreenResult?)
    case next(ScreenResult?)
}

internal final class NavigationEvent {

    typealias EventHandler = ((Navigation) -> Void)

    var eventHandler: EventHandler?

    func send(_ navigation: Navigation) {
        eventHandler?(navigation)
    }

    func on(_ handler: @escaping EventHandler) {
        eventHandler = handler
    }
}
