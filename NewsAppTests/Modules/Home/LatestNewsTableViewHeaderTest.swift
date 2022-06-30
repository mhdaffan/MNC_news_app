//
//  LatestNewsTableViewHeaderTest.swift
//  NewsAppTests
//
//  Created by Muhammad Affan on 30/6/22.
//

import XCTest
@testable import NewsApp

final class LatestNewsTableViewHeaderTest: XCTestCase {
    
    func test_configureUI() {
        let sut = makeSUT()
        sut.configureUI()
        
        XCTAssertTrue(sut.contentView.contains(sut.topSeparator))
        XCTAssertTrue(sut.contentView.contains(sut.titleLabel))
        XCTAssertTrue(sut.contentView.contains(sut.bottomSeparator))
        XCTAssertEqual(sut.contentView.subviews.count, 3)
    }
    
    // MARK: - Helper
    
    func makeSUT(file: StaticString = #file, line: UInt = #line) -> LatestNewsTableViewHeader {
        let sut = LatestNewsTableViewHeader()
        trackForMemoryLeaks(sut, file: file, line: line)
        
        return sut
    }
}


