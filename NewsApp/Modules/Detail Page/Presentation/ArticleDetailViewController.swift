//
//  ArticleDetailViewController.swift
//  NewsApp
//
//  Created by Muhammad Affan on 30/6/22.
//

import UIKit
import SnapKit

final class ArticleDetailViewController: ViewController {
    
    private let viewModel: ArticleDetailViewModel
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    init(viewModel: ArticleDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        view.backgroundColor = .white
    }
    
}
