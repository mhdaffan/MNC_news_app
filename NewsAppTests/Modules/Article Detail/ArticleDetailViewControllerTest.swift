//
//  ArticleDetailViewControllerTest.swift
//  NewsAppTests
//
//  Created by Muhammad Affan on 30/6/22.
//

import XCTest
@testable import NewsApp

final class ArticleDetailViewControllerTest: XCTestCase {
    
    func test_configureUI() {
        let sut = makeSUT(slideshow: [])
        sut.configureUI()
        
        XCTAssertTrue(sut.view.contains(sut.scrollView))
        XCTAssertTrue(sut.scrollView.contains(sut.containerView))
        XCTAssertTrue(sut.containerView.contains(sut.titleLabel))
        XCTAssertTrue(sut.containerView.contains(sut.contributorNameLabel))
        XCTAssertTrue(sut.containerView.contains(sut.dateLabel))
        XCTAssertTrue(sut.containerView.contains(sut.thumbnailImageView))
        XCTAssertTrue(sut.containerView.contains(sut.collectionView))
        XCTAssertTrue(sut.containerView.contains(sut.contentLabel))
        XCTAssertEqual(sut.view.subviews.count, 1)
        XCTAssertEqual(sut.scrollView.subviews.count, 1)
        XCTAssertEqual(sut.containerView.subviews.count, 6)
    }
    
    func test_collectionViewHeight_withEmptySlideShow() {
        let sut = makeSUT(slideshow: [])
        
        XCTAssertEqual(sut.collectionViewHeight, 0)
    }
    
    func test_collectionViewHeight_withSlideShow() {
        let sut = makeSUT(slideshow: ["http://placeimg.com/640/480/nature",
                                      "http://placeimg.com/640/480/fashion"])
        
        XCTAssertEqual(sut.collectionViewHeight, 100)
    }
    
    func test_updateUI() {
        let sut = makeSUT(slideshow: [])
        sut.updateUI()
        
        XCTAssertEqual(sut.titleLabel.text, "maiores cupiditate recusandae")
        XCTAssertEqual(sut.contributorNameLabel.text, "Juanita Marks PhD")
        XCTAssertEqual(sut.dateLabel.text, "2021-05-23T06:21:16.683Z")
        XCTAssertEqual(sut.contentLabel.text, "some content")
    }
    
    // MARK: - Helper
    
    func makeSUT(slideshow: [String], file: StaticString = #file, line: UInt = #line) -> ArticleDetailViewController {
        let screenModel = ArticleItemModel(
            id: "1",
            createdAt: "2021-05-23T06:21:16.683Z",
            contributorName: "Juanita Marks PhD",
            contributorAvatar: "https://cdn.fakercloud.com/avatars/travishines_128.jpg",
            title: "maiores cupiditate recusandae",
            content: "some content",
            contentThumbnail: "http://placeimg.com/640/480/nature",
            slideshow: slideshow)
        let viewModel = ArticleDetailViewModel(screenModel: screenModel)
        let sut = ArticleDetailViewController(viewModel: viewModel)
        trackForMemoryLeaks(sut, file: file, line: line)
        
        return sut
    }
}
