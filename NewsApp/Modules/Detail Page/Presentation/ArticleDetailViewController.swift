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
    var collectionViewHeight: CGFloat {
        return viewModel.screenModel.slideshow.isEmpty ? 0 : 100
    }
    
    // MARK: UI Properties
    
    private(set) lazy var scrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private(set) var containerView = UIView()
    private(set) var titleLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.backgroundColor = .white
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 18)
    }
    private(set) var contributorNameLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.backgroundColor = .white
        $0.textColor = .systemPink
        $0.font = .systemFont(ofSize: 12)
    }
    private(set) var dateLabel = UILabel().then {
        $0.backgroundColor = .white
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 10)
    }
    private(set) var thumbnailImageView = UIImageView().then {
        $0.clipsToBounds = true
        $0.backgroundColor = .gray
    }
    private(set) var contentLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.backgroundColor = .white
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12)
    }
    private lazy var flowLayout = UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: 100, height: 75)
        $0.scrollDirection = .horizontal
        $0.minimumInteritemSpacing = 10
        $0.minimumLineSpacing = 10
    }
    private(set) lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout).then {
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dataSource = self
        $0.delegate = self
        $0.register(cell: ArticleDetailSlideShowItemCollectionViewCell.self)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail"
        configureUI()
        updateUI()
    }
    
    init(viewModel: ArticleDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(self.view)
        }
        
        containerView.addSubviews(titleLabel, contributorNameLabel, dateLabel, thumbnailImageView, collectionView, contentLabel)
        titleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(24)
        }
        contributorNameLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(titleLabel)
        }
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(contributorNameLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalTo(titleLabel)
        }
        let height = view.getSizeRatio(targetWidth: AppInfo.screenWidth, width: 640, height: 480).height
        thumbnailImageView.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(height)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(thumbnailImageView.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(titleLabel)
            $0.height.equalTo(collectionViewHeight)
        }
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(24)
            $0.leading.trailing.equalTo(titleLabel)
            $0.bottom.equalToSuperview().inset(24)
        }
    }
    
    func updateUI() {
        let screenModel = viewModel.screenModel
        titleLabel.text = screenModel.title
        contributorNameLabel.text = screenModel.contributorName
        dateLabel.text = screenModel.createdAt
        contentLabel.text = screenModel.content
        thumbnailImageView.setImageURL(urlString: screenModel.contentThumbnail, placeholder: "", contentMode: .scaleToFill)
    }
    
}

extension ArticleDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.screenModel.slideshow.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cell: ArticleDetailSlideShowItemCollectionViewCell.self)
        cell.updateUI(imageUrl: viewModel.screenModel.slideshow[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        thumbnailImageView.setImageURL(
            urlString: viewModel.screenModel.slideshow[indexPath.row],
            placeholder: "",
            contentMode: .scaleToFill)
    }
    
}
