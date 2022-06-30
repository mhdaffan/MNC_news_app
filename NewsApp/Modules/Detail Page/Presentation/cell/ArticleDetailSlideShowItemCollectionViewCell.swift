//
//  ArticleDetailSlideShowItemCollectionViewCell.swift
//  NewsApp
//
//  Created by Muhammad Affan on 30/6/22.
//

import UIKit
import SnapKit

final class ArticleDetailSlideShowItemCollectionViewCell: UICollectionViewCell, ReusableViewCell {
    
    // MARK: - UI Properties
    
    private(set) var imageView = UIImageView().then {
        $0.clipsToBounds = true
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 5
    }
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.backgroundColor = .gray
    }
    
    func configureUI() {
        contentView.backgroundColor = .white
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func updateUI(imageUrl: String) {
        self.imageView.setImageURL(urlString: imageUrl, placeholder: "", contentMode: .scaleToFill)
    }
    
}
