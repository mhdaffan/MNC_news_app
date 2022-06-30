//
//  HomeScreenTest.swift
//  NewsAppTests
//
//  Created by Muhammad Affan on 30/6/22.
//

import XCTest
@testable import NewsApp

final class HomeScreenTest: XCTestCase {
    
    func test_identifier() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.identifier, "Home Screen")
    }
    
    // MARK: - Helper
    
    func makeSUT(file: StaticString = #file, line: UInt = #line) -> HomeScreen {
        let sut = HomeScreen(())
        trackForMemoryLeaks(sut, file: file, line: line)
        
        return sut
    }
    
}
