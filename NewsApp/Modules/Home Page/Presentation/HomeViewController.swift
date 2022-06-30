//
//  HomeViewController.swift
//  NewsApp
//
//  Created by Muhammad Affan on 29/6/22.
//

import UIKit
import RxSwift

final class HomeViewController: ViewController {
    
    var viewModel: HomeViewModel
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Properties
    
    private(set) lazy var tableView = UITableView(frame: .zero, style: .grouped).then {
        $0.backgroundColor = .white
        $0.separatorStyle = .none
        $0.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        $0.estimatedSectionHeaderHeight = 34
        $0.refreshControl = refreshControl
        $0.register(cell: LatestNewsTableViewCell.self)
        $0.register(cell: PopularNewsTableViewCell.self)
        $0.register(headerFooter: LatestNewsTableViewHeader.self)
        $0.delegate = self
        $0.dataSource = self
    }
    private(set) lazy var refreshControl = UIRefreshControl().then {
        $0.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        $0.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        observeViewModel()
        fetchArticles()
    }
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func observeViewModel() {
        viewModel.articlesRelay.asDriver().drive(onNext: { [weak self] _ in
            self?.tableView.reloadData()
            self?.refreshControl.endRefreshing()
        }).disposed(by: disposeBag)
    }
    
    private func fetchArticles() {
        refreshControl.beginRefreshing()
        refresh()
    }
    
    @objc private func refresh() {
        viewModel.getArticles()
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let articleModel = viewModel.articlesRelay.value else {
            return
        }
        switch indexPath.section {
        case 0:
            navigationEvent.send(.next(articleModel.popularArticle))
        default:
            navigationEvent.send(.next(articleModel.latestArticles[indexPath.row]))
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.articlesRelay.value == nil ? 0 : 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return nil
        default:
            return tableView.dequeueReusableHeaderFooterView(withIdentifier: LatestNewsTableViewHeader.cellIdentifier) as? LatestNewsTableViewHeader
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 80
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let articles = viewModel.articlesRelay.value
        switch section {
        case 0:
            return articles?.popularArticle == nil ? 0 : 1
        default:
            return articles?.latestArticles.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let articleModel = viewModel.articlesRelay.value else {
            return UITableViewCell()
        }
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(for: indexPath, cell: PopularNewsTableViewCell.self)
            cell.selectionStyle = .none
            if let popularArticle = articleModel.popularArticle {
                cell.updateUI(cellModel: popularArticle)
            }
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cell: LatestNewsTableViewCell.self)
        cell.selectionStyle = .none
        cell.updateUI(cellModel: articleModel.latestArticles[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
