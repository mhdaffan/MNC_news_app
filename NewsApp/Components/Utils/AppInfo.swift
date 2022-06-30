//
//  AppInfo.swift
//  NewsApp
//
//  Created by Muhammad Affan on 30/6/22.
//

import UIKit
import Reachability

class AppInfo {

    static var screenWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }

    static var screenHeight: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    static var isNetConnected: Bool {
        return Reachability()?.connection != Reachability.Connection.none
    }

}
