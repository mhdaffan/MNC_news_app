//
//  HomeViewController.swift
//  NewsApp
//
//  Created by Muhammad Affan on 29/6/22.
//

import Foundation

final class HomeViewController: ViewController {
    
    let viewModel: HomeViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        view.backgroundColor = .red
    }
    
}
