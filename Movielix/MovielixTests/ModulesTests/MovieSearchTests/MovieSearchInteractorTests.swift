//
//  MovieResponsableTests.swift
//  MovielixTests
//
//  Created by Mustafa Ezzat on 5/6/20.
//  Copyright © 2020 Swvl. All rights reserved.
//
import XCTest
@testable import Movielix

class MovieSearchInteractorTests: XCTestCase {
    var sut: MovieSearchInteractorProtocol!
    
    override func setUp() {
        super.setUp()
        // should init after super.setup()
        sut = MovieSearchInteractor()
    }

    override func tearDown() {
        // should deinit before super.tearDown()
        sut = nil
        super.tearDown()
    }
    
    func fetchMovies(completionHandler: @escaping (Result<MovieResponse, Error>) -> Void) {
       
    }

    func test_MovieSearchInteractor_ReadMoviesFromJson() {
        sut.readMovies() { result in
            switch(result) {
            case .success(let response):
                XCTAssertGreaterThanOrEqual(response.movies.count, 0)
            case .failure(let error):
                XCTAssert(false, error.localizedDescription)
            }
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
