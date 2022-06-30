//
//  LatestNewsTableViewCell.swift
//  NewsApp
//
//  Created by Muhammad Affan on 30/6/22.
//

import UIKit
import SnapKit

final class LatestNewsTableViewCell: UITableViewCell, ReusableViewCell {
    
    // MARK: - UI Properties
    
    private(set) var thumbnailImageView = UIImageView().then {
        $0.clipsToBounds = true
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 5
    }
    private(set) var contributorNameLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.backgroundColor = .white
        $0.textColor = .systemPink
        $0.font = .systemFont(ofSize: 12)
    }
    private(set) var titleLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.backgroundColor = .white
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 18)
    }
    private(set) var dateLabel = UILabel().then {
        $0.backgroundColor = .white
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 10)
    }
    private(set) var separatorView = UIView().then {
        $0.backgroundColor = .lightGray
    }
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.backgroundColor = .gray
    }
    
    func configureUI() {
        contentView.backgroundColor = .white
        contentView.addSubviews(thumbnailImageView, contributorNameLabel, titleLabel, dateLabel, separatorView)
        
        let ratio = getSizeRatio(targetWidth: AppInfo.screenWidth - 48, width: 640, height: 480)
        thumbnailImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(ratio.height)
        }
        contributorNameLabel.snp.makeConstraints {
            $0.top.equalTo(thumbnailImageView.snp.bottom).offset(12)
            $0.leading.trailing.equalTo(thumbnailImageView)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(contributorNameLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(thumbnailImageView)
        }
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalTo(thumbnailImageView)
        }
        separatorView.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(24)
            $0.leading.trailing.equalTo(thumbnailImageView)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    func updateUI(cellModel: ArticleItemModel) {
        thumbnailImageView.setImageURL(urlString: cellModel.contentThumbnail, placeholder: "", contentMode: .scaleToFill)
        contributorNameLabel.text = cellModel.contributorName
        titleLabel.text = cellModel.title
        dateLabel.text = cellModel.createdAt
    }
    
}
