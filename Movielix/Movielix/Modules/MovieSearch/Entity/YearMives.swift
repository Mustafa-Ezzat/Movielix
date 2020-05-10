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

struct YearMives: Category {
    typealias Key = Int
    typealias Value = Movie
    let year: Key?
    let movies: [Value]?
}

extension YearMives: Comparable & Hashable {
    static func < (lhs: YearMives, rhs: YearMives) -> Bool {
        guard let lhsYear = lhs.year, let rhsYear = rhs.year else {
            return false
        }
        return lhsYear < rhsYear
    }
    static func == (lhs: YearMives, rhs: YearMives) -> Bool {
        return lhs.year == rhs.year
    }
}

extension YearMives: Realmable {
    init() {
        year = 0
        movies = []
    }
}
