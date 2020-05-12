//
//  YearMovie.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation
import Unrealm

protocol Category {
    associatedtype Key: Hashable & Comparable
    associatedtype Value: Hashable & Comparable
}

struct MoviesPerYear: Category {
    typealias Key = Int
    typealias Value = Movie
    let year: Key?
    let movies: [Value]?
}

extension MoviesPerYear: Comparable & Hashable {
    static func < (lhs: MoviesPerYear, rhs: MoviesPerYear) -> Bool {
        guard let lhsYear = lhs.year, let rhsYear = rhs.year else {
            return false
        }
        return lhsYear < rhsYear
    }
    static func == (lhs: MoviesPerYear, rhs: MoviesPerYear) -> Bool {
        return lhs.year == rhs.year
    }
}

extension MoviesPerYear: Realmable {
    init() {
        year = 0
        movies = []
    }
}
