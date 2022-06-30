//
//  LatestNewsTableViewCellTest.swift
//  NewsAppTests
//
//  Created by Muhammad Affan on 30/6/22.
//

import XCTest
@testable import NewsApp

final class LatestNewsTableViewCellTest: XCTestCase {
    
    func test_configureUI() {
        let sut = makeSUT()
        sut.configureUI()
        
        XCTAssertTrue(sut.contentView.contains(sut.thumbnailImageView))
        XCTAssertTrue(sut.contentView.contains(sut.titleLabel))
        XCTAssertTrue(sut.contentView.contains(sut.contributorNameLabel))
        XCTAssertTrue(sut.contentView.contains(sut.dateLabel))
        XCTAssertTrue(sut.contentView.contains(sut.separatorView))
        XCTAssertEqual(sut.contentView.subviews.count, 5)
    }
    
    func test_prepareForReuse() {
        let sut = makeSUT()
        sut.prepareForReuse()
        
        XCTAssertEqual(sut.thumbnailImageView.backgroundColor, UIColor.gray)
    }
    
    func test_updateUI() {
        let sut = makeSUT()
        let cellModel = ArticleItemModel(
            id: "1",
            createdAt: "2021-05-23T06:21:16.683Z",
            contributorName: "Juanita Marks PhD",
            contributorAvatar: "https://cdn.fakercloud.com/avatars/travishines_128.jpg",
            title: "maiores cupiditate recusandae",
            content: "some content",
            contentThumbnail: "http://placeimg.com/640/480/nature",
            slideshow: [])
        sut.updateUI(cellModel: cellModel)
        
        XCTAssertEqual(sut.titleLabel.text, "maiores cupiditate recusandae")
        XCTAssertEqual(sut.contributorNameLabel.text, "Juanita Marks PhD")
        XCTAssertEqual(sut.dateLabel.text, "2021-05-23T06:21:16.683Z")
    }
    
    // MARK: - Helper
    
    func makeSUT(file: StaticString = #file, line: UInt = #line) -> LatestNewsTableViewCell {
        let sut = LatestNewsTableViewCell()
        trackForMemoryLeaks(sut, file: file, line: line)
        
        return sut
    }
}
