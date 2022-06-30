//
//  ExtImageView + Kingfisher.swift
//  NewsApp
//
//  Created by Muhammad Affan on 30/6/22.
//

import Kingfisher

extension UIImageView {
    
    func setImageURL(urlString: String, placeholder: String, contentMode: UIView.ContentMode = .scaleAspectFill) {
//        var newUrl = urlString.replacingOccurrences(of: "http", with: "https")
//        if let url = newUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
//            newUrl = url
//        }
        
        let url = URL(string: urlString)
        let placeholder = Image(named: placeholder)
        
        self.kf.setImage(with: url, placeholder: placeholder, options: [.transition(.fade(0.2))], completionHandler: { result in
            switch result {
            case .success(_):
                self.backgroundColor = .clear
                self.contentMode = contentMode
            case .failure(_):
                self.contentMode = contentMode
            }
        })
    }
}
