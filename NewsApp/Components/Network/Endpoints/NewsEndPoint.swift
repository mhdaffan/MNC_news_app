//
//  NewsEndPoint.swift
//  NewsApp
//
//  Created by Muhammad Affan on 30/6/22.
//

enum NewsEndPoint {
    case articles
}

extension NewsEndPoint: Endpoint {
    
    var base: String {
        return "https://60a4954bfbd48100179dc49d.mockapi.io/api"
    }
    
    var path: String {
        switch self {
        case .articles:
            return "/innocent/newsapp/articles"
        }
    }
    
}
