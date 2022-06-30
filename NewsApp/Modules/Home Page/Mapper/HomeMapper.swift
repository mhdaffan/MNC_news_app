//
//  HomeMapper.swift
//  NewsApp
//
//  Created by Muhammad Affan on 29/6/22.
//

protocol HomeMapper {
    func articleResponseToDomain(response: [ArticleResponseModel]) -> [ArticleModel]
}

class HomeMapperImpl: HomeMapper {
    
    func articleResponseToDomain(response: [ArticleResponseModel]) -> [ArticleModel] {
        return response.map { item -> ArticleModel in
            return ArticleModel(
                id: item.id,
                createdAt: item.createdAt,
                contributorName: item.contributorName,
                contributorAvatar: item.contributorAvatar,
                title: item.title,
                content: item.content,
                contentThumbnail: item.contentThumbnail,
                slideshow: item.slideshow)
        }
    }
    
}
