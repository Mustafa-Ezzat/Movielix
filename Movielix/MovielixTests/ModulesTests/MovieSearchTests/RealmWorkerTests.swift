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
        Realm.registerRealmables(YearMives.self)
    }
    func fetchMovies(completion: @escaping (Bool) -> Void) {
        sut.save(contentsOf: ConstantTests.movies, completion: { result in
             completion(result)
        })
    }
    func fetchYearMovies(completion: @escaping (Bool) -> Void) {
        sut.save(contentsOf: ConstantTests.categorizedMovies, completion: { result in
            completion(result)
        })
    }
    func test_RealmWorker_Write_MovieList() {
        fetchMovies { result in
            XCTAssert(result)
        }
    }
    func test_RealmWorker_Write_YearMovieList() {
        fetchYearMovies { result in
            XCTAssert(result)
        }
    }
    func test_RealmWorker_fetch_MovieList_isEmpty() {
        let list = sut.fetch(object: Movie.self)
        XCTAssertEqual(list.all().count, 0)
    }
    func test_RealmWorker_fetch_YearMovieList_isEmpty() {
        let list = sut.fetch(object: YearMives.self)
        XCTAssertEqual(list.all().count, 0)
    }
    func test_RealmWorker_fetch_MovieList() {
        fetchMovies { [unowned self] _ in
            let list = self.sut.fetch(object: Movie.self)
            XCTAssertEqual(list.all().count, ConstantTests.movies.count)
        }
    }
    func test_RealmWorker_fetch_YearMovieList() {
        fetchYearMovies { [unowned self] _ in
            let list = self.sut.fetch(object: YearMives.self)
            XCTAssertEqual(list.all().count, ConstantTests.categorizedMovies.count)
        }
    }

}
