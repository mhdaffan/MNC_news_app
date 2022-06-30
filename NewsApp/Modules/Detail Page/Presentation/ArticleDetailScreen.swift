//
//  ArticleDetailScreen.swift
//  NewsApp
//
//  Created by Muhammad Affan on 30/6/22.
//

let articleDetailScreenIdentifier = "ArticleDetailScreen"

final class ArticleDetailScreen: Screen<ArticleItemModel> {
    
    override var identifier: String {
        return articleDetailScreenIdentifier
    }
    
    override func build() -> ViewController {
        let viewModel = ArticleDetailViewModel(screenModel: input)
        let viewController = ArticleDetailViewController(viewModel: viewModel)
        
        viewController.navigationEvent.on({ navigation in
            self.event?(navigation)
        })
        
        return viewController
    }
    
}
