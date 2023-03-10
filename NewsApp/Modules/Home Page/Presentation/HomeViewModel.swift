//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by Muhammad Affan on 29/6/22.
//

import RxSwift
import RxCocoa

final class HomeViewModel: BaseViewModel {
    
    let useCase: HomeUseCase
    let articlesRelay = BehaviorRelay<ArticleModel?>(value: nil)
    
    init(useCase: HomeUseCase) {
        self.useCase = useCase
    }
    
    func getArticles() {
        useCase.getArticles()
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(
                onNext: { [weak self] response in
                    self?.articlesRelay.accept(response)
                    self?.errorRelay.accept(nil)
                }, onError: { [weak self] error in
                    self?.articlesRelay.accept(nil)
                    self?.errorRelay.accept(error)
                })
            .disposed(by: disposeBag)
    }
    
}
