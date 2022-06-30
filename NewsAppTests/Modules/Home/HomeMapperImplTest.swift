//
//  HomeMapperImplTest.swift
//  NewsAppTests
//
//  Created by Muhammad Affan on 30/6/22.
//

import XCTest
@testable import NewsApp

final class HomeMapperImplTest: XCTestCase {
    
    var dummyArticleResponseModel: [ArticleResponseModel] = [
        .init(
            id: "1",
            createdAt: "2021-05-23T06:21:16.683Z",
            contributorName: "Juanita Marks PhD",
            contributorAvatar: "https://cdn.fakercloud.com/avatars/travishines_128.jpg",
            title: "maiores cupiditate recusandae",
            content: "some content",
            contentThumbnail: "http://placeimg.com/640/480/nature",
            slideshow: []),
        .init(
            id: "2",
            createdAt: "2021-05-24T00:14:44.689Z",
            contributorName: "Irma Grant",
            contributorAvatar: "https://cdn.fakercloud.com/avatars/mrjamesnoble_128.jpg",
            title: "dolor aut aut",
            content: "Earum voluptas magnam doloribus",
            contentThumbnail: "http://placeimg.com/640/480/abstract",
            slideshow: ["http://placeimg.com/640/480/nature",
                        "http://placeimg.com/640/480/fashion"])
    ]
    
    func test_articleResponseToDomain_haveLatestArticles() {
        let sut = makeSUT()
        
        let articleModel = sut.articleResponseToDomain(response: dummyArticleResponseModel)
        
        XCTAssertEqual(articleModel.latestArticles[0].id, "1")
        XCTAssertEqual(articleModel.latestArticles[0].createdAt, "2021-05-23T06:21:16.683Z")
        XCTAssertEqual(articleModel.latestArticles[0].contributorName, "Juanita Marks PhD")
        XCTAssertEqual(articleModel.latestArticles[0].contributorAvatar, "https://cdn.fakercloud.com/avatars/travishines_128.jpg")
        XCTAssertEqual(articleModel.latestArticles[0].title, "maiores cupiditate recusandae")
        XCTAssertEqual(articleModel.latestArticles[0].content, "some content")
        XCTAssertEqual(articleModel.latestArticles[0].contentThumbnail, "http://placeimg.com/640/480/nature")
        XCTAssertEqual(articleModel.latestArticles[0].slideshow, [])
        XCTAssertEqual(articleModel.latestArticles[1].id, "2")
        XCTAssertEqual(articleModel.latestArticles[1].createdAt, "2021-05-24T00:14:44.689Z")
        XCTAssertEqual(articleModel.latestArticles[1].contributorName, "Irma Grant")
        XCTAssertEqual(articleModel.latestArticles[1].contributorAvatar, "https://cdn.fakercloud.com/avatars/mrjamesnoble_128.jpg")
        XCTAssertEqual(articleModel.latestArticles[1].title, "dolor aut aut")
        XCTAssertEqual(articleModel.latestArticles[1].content, "Earum voluptas magnam doloribus")
        XCTAssertEqual(articleModel.latestArticles[1].contentThumbnail, "http://placeimg.com/640/480/abstract")
        XCTAssertEqual(articleModel.latestArticles[1].slideshow, ["http://placeimg.com/640/480/nature", "http://placeimg.com/640/480/fashion"])
        XCTAssertEqual(articleModel.latestArticles.count, 2)
    }
    
    func test_articleResponseToDomain_haveNilPopularArticle() {
        let sut = makeSUT()
        
        let articleModel = sut.articleResponseToDomain(response: [])
        
        XCTAssertNil(articleModel.popularArticle)
    }
    
    func test_articleResponseToDomain_haveNotNilPopularArticle() {
        let sut = makeSUT()
        
        let articleModel = sut.articleResponseToDomain(response: dummyArticleResponseModel)
        
        XCTAssertNotNil(articleModel.popularArticle)
    }
    
    // MARK: - Helper
    
    func makeSUT(file: StaticString = #file, line: UInt = #line) -> HomeMapperImpl {
        let sut = HomeMapperImpl()
        trackForMemoryLeaks(sut, file: file, line: line)
        
        return sut
    }
    
}
