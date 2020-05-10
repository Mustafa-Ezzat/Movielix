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

    func test_MovieSearcher_Query_Prefix() {
        let keyword = "The one"
        let result = sut.query(list: ConstantTests.categorizedMovies, keyword: keyword)
        XCTAssertEqual(result.description, ConstantTests.prefixMovieWithTheOne.description)
    }
    func test_MovieSearcher_Query_Postfix() {
        let keyword = "Madea Halloween"
        let result = sut.query(list: ConstantTests.categorizedMovies, keyword: keyword)
        XCTAssertEqual(result.description, ConstantTests.postfixMovieWithMadeaHalloween.description)
    }
    func test_MovieSearcher_Query_Infix() {
        let keyword = "Bob\'s Super Groovy"
        let result = sut.query(list: ConstantTests.categorizedMovies, keyword: keyword)
        XCTAssertEqual(result.description, ConstantTests.infixMovieBobSuperGroovy.description)
    }
}
