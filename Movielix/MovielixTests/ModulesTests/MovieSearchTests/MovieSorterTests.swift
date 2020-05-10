//
//  SorterTests.swift
//  MovielixTests
//
//  Created by Mustafa Ezzat on 5/8/20.
//  Copyright © 2020 Swvl. All rights reserved.
//
import XCTest
@testable import Movielix

class MovieSorterTests: XCTestCase {
    var sut: MovieSorter!
    override func setUp() {
        super.setUp()
        // should init after super.setup()
        sut = MovieSorter()
    }

    override func tearDown() {
        // should deinit before super.tearDown()
        sut = nil
        super.tearDown()
    }

    func test_MovieSorter_Sort() {
        let sortedMovies = sut.sort(list: ConstantTests.movies)
        XCTAssertEqual(sortedMovies.description, ConstantTests.sortedMovies.description)
    }
    func testPerformanceSort() {
          // This is an example of a performance test case.
          self.measure {
              // Put the code you want to measure the time of here.
              _ = sut.sort(list: ConstantTests.movies)
          }
    }
}
