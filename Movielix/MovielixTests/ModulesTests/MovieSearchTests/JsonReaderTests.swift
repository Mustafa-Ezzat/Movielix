//
//  MovieResponsableTests.swift
//  MovielixTests
//
//  Created by Mustafa Ezzat on 5/6/20.
//  Copyright © 2020 Swvl. All rights reserved.
//
import XCTest
@testable import Movielix

class JsonReaderTests: XCTestCase {
    var sut: Reader!
    override func setUp() {
        super.setUp()
        // should init after super.setup()
        sut = JsonReader()
    }

    override func tearDown() {
        // should deinit before super.tearDown()
        sut = nil
        super.tearDown()
    }

    func test_JsonReader_ReadMoviesFromJson() {
        sut.read { result in
            switch result {
            case .success(let response):
                XCTAssertGreaterThanOrEqual(response.movies.count, 0)
            case .failure(let error):
                XCTAssert(false, error.localizedDescription)
            }
        }
    }
    func testPerformanceRead() {
          // This is an example of a performance test case.
          self.measure {
              // Put the code you want to measure the time of here.
            sut.read { _ in }
          }
    }

}
