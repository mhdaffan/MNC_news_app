//
//  HomeUseCase.swift
//  NewsApp
//
//  Created by Muhammad Affan on 29/6/22.
//

protocol HomeUseCase {
    
}

class HomeUseCaseImpl: HomeUseCase {
    
    private let repository: HomeRepository
    private let mapper: HomeMapper
    
    init(repository: HomeRepository, mapper: HomeMapper) {
        self.repository = repository
        self.mapper = mapper
    }
    
}
