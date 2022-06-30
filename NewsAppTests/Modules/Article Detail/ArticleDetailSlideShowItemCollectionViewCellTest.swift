//
//  ArticleDetailSlideShowItemCollectionViewCellTest.swift
//  NewsAppTests
//
//  Created by Muhammad Affan on 30/6/22.
//

import XCTest
@testable import NewsApp

final class ArticleDetailSlideShowItemCollectionViewCellTest: XCTestCase {
    
    func test_configureUI() {
        let sut = makeSUT()
        sut.configureUI()
        
        XCTAssertTrue(sut.contentView.contains(sut.imageView))
        XCTAssertEqual(sut.contentView.subviews.count, 1)
    }
    
    func test_prepareForReuse() {
        let sut = makeSUT()
        sut.prepareForReuse()
        
        XCTAssertEqual(sut.imageView.backgroundColor, UIColor.gray)
    }
    
    // MARK: - Helper
    
    func makeSUT(file: StaticString = #file, line: UInt = #line) -> ArticleDetailSlideShowItemCollectionViewCell {
        let sut = ArticleDetailSlideShowItemCollectionViewCell()
        trackForMemoryLeaks(sut, file: file, line: line)
        
        return sut
    }
}
