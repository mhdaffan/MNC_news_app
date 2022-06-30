//
//  HomeRepository.swift
//  NewsApp
//
//  Created by Muhammad Affan on 29/6/22.
//

import RxSwift

protocol HomeRepository {
    func getArticles() -> Observable<[ArticleResponseModel]>
}

class HomeRepositoryImpl: HomeRepository {
    
    private let remote: HomeRemoteDataSource
    
    init(remote: HomeRemoteDataSource) {
        self.remote = remote
    }
    
    func getArticles() -> Observable<[ArticleResponseModel]> {
        return remote.getArticles()
    }
    
}
