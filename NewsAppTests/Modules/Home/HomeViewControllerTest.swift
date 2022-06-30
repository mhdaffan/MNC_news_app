//
//  HomeViewControllerTest.swift
//  NewsAppTests
//
//  Created by Muhammad Affan on 30/6/22.
//

import XCTest
@testable import NewsApp

final class HomeViewControllerTest: XCTestCase {
    
    let articleModel = ArticleModel(
        popularArticle: .init(id: "1",
                              createdAt: "2021-05-23T06:21:16.683Z",
                              contributorName: "Juanita Marks PhD",
                              contributorAvatar: "https://cdn.fakercloud.com/avatars/travishines_128.jpg",
                              title: "maiores cupiditate recusandae",
                              content: "some content",
                              contentThumbnail: "http://placeimg.com/640/480/nature",
                              slideshow: []),
        latestArticles: [.init(id: "1",
                               createdAt: "2021-05-23T06:21:16.683Z",
                               contributorName: "Juanita Marks PhD",
                               contributorAvatar: "https://cdn.fakercloud.com/avatars/travishines_128.jpg",
                               title: "maiores cupiditate recusandae",
                               content: "some content",
                               contentThumbnail: "http://placeimg.com/640/480/nature",
                               slideshow: [])]
    )
    
    func test_configureUI() {
        let sut = makeSUT()
        sut.configureUI()
        
        XCTAssertTrue(sut.view.contains(sut.tableView))
        XCTAssertEqual(sut.tableView.refreshControl, sut.refreshControl)
        XCTAssertEqual(sut.view.subviews.count, 1)
    }
    
    func test_heightForHeaderInSections() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.tableView.delegate?.tableView?(sut.tableView, heightForHeaderInSection: 0), 0)
        XCTAssertEqual(sut.tableView.delegate?.tableView?(sut.tableView, heightForHeaderInSection: 1), 80)
    }
    
    func test_viewForHeaderInSections() {
        let sut = makeSUT()
        let latestNewsTableViewHeader = sut.tableView.delegate?.tableView?(sut.tableView, viewForHeaderInSection: 1)
        
        XCTAssertNil(sut.tableView.delegate?.tableView?(sut.tableView, viewForHeaderInSection: 0))
        XCTAssertEqual(latestNewsTableViewHeader, latestNewsTableViewHeader as? LatestNewsTableViewHeader)
    }
    
    func test_heightForFooterInSections() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.tableView.delegate?.tableView?(sut.tableView, heightForFooterInSection: 0), 0)
        XCTAssertEqual(sut.tableView.delegate?.tableView?(sut.tableView, heightForFooterInSection: 1), 0)
    }
    
    func test_viewForFooterInSections() {
        let sut = makeSUT()
        
        XCTAssertNil(sut.tableView.delegate?.tableView?(sut.tableView, viewForFooterInSection: 0))
        XCTAssertNil(sut.tableView.delegate?.tableView?(sut.tableView, viewForFooterInSection: 1))
    }
    
    func test_numberOfSections_withEmptyArticles() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.tableView.dataSource?.numberOfSections?(in: sut.tableView), 0)
    }
    
    func test_numberOfSections_withArticleModel() {
        let sut = makeSUT(articleModel: articleModel)
        
        XCTAssertEqual(sut.tableView.dataSource?.numberOfSections?(in: sut.tableView), 2)
    }
    
    func test_numberOfRows_withArticleModel() {
        let sut = makeSUT(articleModel: articleModel)
        
        XCTAssertEqual(sut.tableView.dataSource?.tableView(sut.tableView, numberOfRowsInSection: 0), 1)
        XCTAssertEqual(sut.tableView.dataSource?.tableView(sut.tableView, numberOfRowsInSection: 1), 1)
    }
    
    func test_numberOfRows_withEmptyArticleModel() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.tableView.dataSource?.tableView(sut.tableView, numberOfRowsInSection: 0), 0)
        XCTAssertEqual(sut.tableView.dataSource?.tableView(sut.tableView, numberOfRowsInSection: 1), 0)
    }
    
    func test_cellForRows_withArticleModel() {
        let sut = makeSUT(articleModel: articleModel)
        let popularNewsCell = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        let latestNewsCell = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 1))
        
        XCTAssertEqual(popularNewsCell, popularNewsCell as? PopularNewsTableViewCell)
        XCTAssertEqual(latestNewsCell, latestNewsCell as? LatestNewsTableViewCell)
    }
    
    // MARK: - Helper
    
    func makeSUT(articleModel: ArticleModel? = nil, file: StaticString = #file, line: UInt = #line) -> HomeViewController {
        let remote: HomeRemoteDataSource = HomeRemoteDataSourceImpl()
        let repository: HomeRepository = HomeRepositoryImpl(remote: remote)
        let mapper: HomeMapper = HomeMapperImpl()
        let useCase: HomeUseCase = HomeUseCaseImpl(repository: repository, mapper: mapper)
        let viewModel = HomeViewModel(useCase: useCase)
        viewModel.articlesRelay.accept(articleModel)
        let sut = HomeViewController(viewModel: viewModel)
        trackForMemoryLeaks(viewModel, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        
        return sut
    }
}
