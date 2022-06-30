//
//  HomeScreen.swift
//  NewsApp
//
//  Created by Muhammad Affan on 30/6/22.
//

let homeScreenIdentifier = "Home Screen"

final class HomeScreen: Screen<Void> {
    
    override var identifier: String {
        return homeScreenIdentifier
    }
    
    override func build() -> ViewController {
        let remote: HomeRemoteDataSource = HomeRemoteDataSourceImpl()
        let repository: HomeRepository = HomeRepositoryImpl(remote: remote)
        let mapper: HomeMapper = HomeMapperImpl()
        let useCase: HomeUseCase = HomeUseCaseImpl(repository: repository, mapper: mapper)
        let viewModel = HomeViewModel(useCase: useCase)
        let viewController = HomeViewController(viewModel: viewModel)
        
        viewController.navigationEvent.on({ navigation in
            self.event?(navigation)
        })
        
        return viewController
    }
    
}
