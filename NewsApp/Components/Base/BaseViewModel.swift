//
//  BaseViewModel.swift
//  NewsApp
//
//  Created by Muhammad Affan on 30/6/22.
//

import RxSwift
import RxCocoa

class BaseViewModel {
    
    let disposeBag = DisposeBag()
    
    let errorRelay = BehaviorRelay<Error?>(value: nil)
    
}
