//
//  CategorizerTests.swift
//  MovielixTests
//
//  Created by Mustafa Ezzat on 5/8/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import XCTest
@testable import Movielix

class CategorizerTests: XCTestCase {
    var sut: MovieCategorizer!
    
    override func setUp() {
        super.setUp()
        // should init after super.setup()
        sut = MovieCategorizer()
    }

    override func tearDown() {
        // should deinit before super.tearDown()
        sut = nil
        super.tearDown()
    }

    func test_CategorizerTests_Categorize() {
        sut.categorize(movies: Set(ConstantTests.movies)) { result in
            XCTAssertEqual(result.description, ConstantTests.categorizedMovies.description)
        }
    }
}
