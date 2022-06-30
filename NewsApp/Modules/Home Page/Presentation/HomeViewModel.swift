//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by Muhammad Affan on 29/6/22.
//

import RxSwift

final class HomeViewModel {
    
    let useCase: HomeUseCase
    let disposeBag = DisposeBag()
    
    init(useCase: HomeUseCase) {
        self.useCase = useCase
    }
    
    func getArticles() {
        useCase.getArticles()
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(
                onNext: { [weak self] response in
                    
                }, onError: { [weak self] error in
                    
                })
            .disposed(by: disposeBag)
    }
    
}
