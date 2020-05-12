//
//  MovieSearcher.swift
//  MovielixTests
//
//  Created by Mustafa Ezzat on 5/8/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import XCTest
@testable import Movielix

class MovieSearcherTests: XCTestCase {
    var sut: MovieSearcher!
    override func setUp() {
        super.setUp()
        // should init after super.setup()
        sut = MovieSearcher()
    }

    override func tearDown() {
        // should deinit before super.tearDown()
        sut = nil
        super.tearDown()
    }
    func searchQuery(by keyword: String, completion: @escaping ([MoviesPerYear]) -> Void) {
        let result =  sut.query(list: ConstantTests.categorizedMovies, keyword: keyword)
        completion(result)
    }
    func test_MovieSearcher_Query_Prefix() {
        searchQuery(by: "The one") { result in
            XCTAssertEqual(result.description, ConstantTests.prefixMovieWithTheOne.description)
        }
    }
    func test_MovieSearcher_Query_Postfix() {
        searchQuery(by: "Madea Halloween") { result in
            XCTAssertEqual(result.description, ConstantTests.postfixMovieWithMadeaHalloween.description)
        }
    }
    func test_MovieSearcher_Query_Infix() {
        searchQuery(by: "Bob\'s Super Groovy") { result in
            XCTAssertEqual(result.description, ConstantTests.infixMovieBobSuperGroovy.description)
        }
    }
    func testPerformance_Search_Query() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            searchQuery(by: "Madea Halloween") { _ in }
        }
    }
}
