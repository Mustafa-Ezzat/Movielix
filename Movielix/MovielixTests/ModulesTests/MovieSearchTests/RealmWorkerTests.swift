//
//  RealmWorkerTests.swift
//  MovielixTests
//
//  Created by Mustafa Ezzat on 5/9/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import XCTest
import Unrealm
@testable import Movielix

class RealmWorkerTests: XCTestCase {
    var sut: RealmWorker!
    override func setUp() {
        super.setUp()
        // should init after super.setup()
        sut = RealmWorker()
        registerRealmables()
        sut.clear()
    }
    override func tearDown() {
        // should deinit before super.tearDown()
        sut = nil
        super.tearDown()
    }
    func registerRealmables() {
        Realm.registerRealmables(Movie.self)
        Realm.registerRealmables(MoviesPerYear.self)
    }
    func writeMovies(completion: @escaping (Bool) -> Void) {
        sut.save(contentsOf: ConstantTests.movies, completion: { result in
             completion(result)
        })
    }
    func writeYearMovies(completion: @escaping (Bool) -> Void) {
        sut.save(contentsOf: ConstantTests.categorizedMovies, completion: { result in
            completion(result)
        })
    }
    func test_RealmWorker_Write_MovieList() {
        writeMovies { result in
            XCTAssert(result)
        }
    }
    func test_RealmWorker_Write_YearMovieList() {
        writeYearMovies { result in
            XCTAssert(result)
        }
    }
    func test_RealmWorker_fetch_MovieList_isEmpty() {
        let list = sut.fetch(object: Movie.self)
        XCTAssertEqual(list.all().count, 0)
    }
    func test_RealmWorker_fetch_YearMovieList_isEmpty() {
        let list = sut.fetch(object: MoviesPerYear.self)
        XCTAssertEqual(list.all().count, 0)
    }
    func test_RealmWorker_fetch_MovieList() {
        writeMovies { [unowned self] _ in
            let list = self.sut.fetch(object: Movie.self)
            XCTAssertEqual(list.all().count, ConstantTests.movies.count)
        }
    }
    func test_RealmWorker_fetch_YearMovieList() {
        writeYearMovies { [unowned self] _ in
            let list = self.sut.fetch(object: MoviesPerYear.self)
            XCTAssertEqual(list.all().count, ConstantTests.categorizedMovies.count)
        }
    }

    func testPerformance_Write_Movies() {
          // This is an example of a performance test case.
          self.measure {
              // Put the code you want to measure the time of here.
            writeMovies {_ in}
          }
    }

    func testPerformance_Write_YearMovies() {
            // This is an example of a performance test case.
            self.measure {
                // Put the code you want to measure the time of here.
              writeYearMovies {_ in}
            }
    }
    func testPerformance_Fetch_YearMovies() {
        self.measure {
            writeYearMovies { [unowned self] _ in
                _ = self.sut.fetch(object: MoviesPerYear.self)
            }
        }
    }
    func testPerformance_Fetch_Movies() {
        self.measure {
            writeMovies { [unowned self] _ in
                _ = self.sut.fetch(object: Movie.self)
            }
        }
    }
}
