//
//  ArticleModel.swift
//  NewsApp
//
//  Created by Muhammad Affan on 30/6/22.
//

struct ArticleModel {
    var popularArticle: ArticleItemModel?
    let latestArticles: [ArticleItemModel]
}

struct ArticleItemModel {
    let id: String
    let createdAt: String
    let contributorName: String
    let contributorAvatar: String
    let title: String
    let content: String
    let contentThumbnail: String
    let slideshow: [String]
}
