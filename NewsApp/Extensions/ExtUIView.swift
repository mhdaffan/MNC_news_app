//
//  ExtUIView.swift
//  NewsApp
//
//  Created by Muhammad Affan on 30/6/22.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
    /// Returns new CGSize
    ///
    /// - Parameters:
    ///   - targetWidth: your desire width or AppInfo.screenWidth - (leading inset + trailing inset)
    ///   - width: image width
    ///   - height: image height
    func getSizeRatio(targetWidth: CGFloat, width: CGFloat, height: CGFloat) -> CGSize {
        let ratio: CGFloat = width / height
        let newHeight = targetWidth / ratio
        
        return CGSize(width: targetWidth, height: newHeight)
    }
    
}
