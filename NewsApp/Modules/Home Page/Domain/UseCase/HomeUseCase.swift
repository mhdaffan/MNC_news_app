//
//  HomeUseCase.swift
//  NewsApp
//
//  Created by Muhammad Affan on 29/6/22.
//

import RxSwift

protocol HomeUseCase {
    func getArticles() -> Observable<ArticleModel>
}

class HomeUseCaseImpl: HomeUseCase {
    
    private let repository: HomeRepository
    private let mapper: HomeMapper
    
    init(repository: HomeRepository, mapper: HomeMapper) {
        self.repository = repository
        self.mapper = mapper
    }
    
    func getArticles() -> Observable<ArticleModel> {
        return repository.getArticles()
            .map { self.mapper.articleResponseToDomain(response: $0) }
    }
    
}
