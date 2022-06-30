//
//  LatestNewsTableViewHeader.swift
//  NewsApp
//
//  Created by Muhammad Affan on 30/6/22.
//

import UIKit
import SnapKit

final class LatestNewsTableViewHeader: UITableViewHeaderFooterView, ReusableViewCell {
    
    // MARK: - UI Properties
    private let topSeparator = UIView().then {
        $0.backgroundColor = .lightGray
    }
    private let titleLabel = UILabel().then {
        $0.text = "LATEST NEWS"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 24)
        $0.backgroundColor = .white
    }
    private let bottomSeparator = UIView().then {
        $0.backgroundColor = .lightGray
    }
    
    // MARK: - Lifecycle
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.backgroundColor = .white
        contentView.addSubviews(topSeparator, titleLabel, bottomSeparator)
        topSeparator.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(1)
        }
        titleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        bottomSeparator.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(1)
        }
    }
    
}
