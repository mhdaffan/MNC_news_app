//
//  HomeRepository.swift
//  NewsApp
//
//  Created by Muhammad Affan on 29/6/22.
//

protocol HomeRepository {
    
}

class HomeRepositoryImpl: HomeRepository {
    
    private let remote: HomeRemoteDataSource
    
    init(remote: HomeRemoteDataSource) {
        self.remote = remote
    }
    
}
