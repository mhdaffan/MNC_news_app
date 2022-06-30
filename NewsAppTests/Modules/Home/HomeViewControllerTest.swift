//
//  HomeViewControllerTest.swift
//  NewsAppTests
//
//  Created by Muhammad Affan on 30/6/22.
//

import XCTest
@testable import NewsApp

final class HomeViewControllerTest: XCTestCase {
    
    func test_configureUI() {
        let sut = makeSUT()
        sut.configureUI()
        
        XCTAssertTrue(sut.view.contains(sut.tableView))
        XCTAssertEqual(sut.tableView.refreshControl, sut.refreshControl)
        XCTAssertEqual(sut.view.subviews.count, 1)
    }
    
    // MARK: - Helper
    
    func makeSUT(file: StaticString = #file, line: UInt = #line) -> HomeViewController {
        let remote: HomeRemoteDataSource = HomeRemoteDataSourceImpl()
        let repository: HomeRepository = HomeRepositoryImpl(remote: remote)
        let mapper: HomeMapper = HomeMapperImpl()
        let useCase: HomeUseCase = HomeUseCaseImpl(repository: repository, mapper: mapper)
        let viewModel = HomeViewModel(useCase: useCase)
        let sut = HomeViewController(viewModel: viewModel)
        trackForMemoryLeaks(sut, file: file, line: line)
        
        return sut
    }
}
