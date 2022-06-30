//
//  HomeRemoteDataSource.swift
//  NewsApp
//
//  Created by Muhammad Affan on 29/6/22.
//

import RxSwift

protocol HomeRemoteDataSource {
    func getArticles() -> Observable<[ArticleResponseModel]>
}

class HomeRemoteDataSourceImpl: HomeRemoteDataSource {
    
    func getArticles() -> Observable<[ArticleResponseModel]> {
        return APIProvider.request(
            endpoint: NewsEndPoint.articles,
            response: [ArticleResponseModel].self)
    }
    
}
