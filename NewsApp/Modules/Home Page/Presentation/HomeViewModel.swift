//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by Muhammad Affan on 29/6/22.
//

import Foundation

final class HomeViewModel {
    
    let useCase: HomeUseCase
    
    init(useCase: HomeUseCase) {
        self.useCase = useCase
    }
}
