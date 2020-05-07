//
//  YearMovie.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation

struct YearMives<T> where T: Hashable & Comparable {
    let year: T
    let movies: [Movie]    
}

extension YearMives: Comparable {
    static func < (lhs: YearMives, rhs: YearMives) -> Bool {
        return lhs.year < rhs.year
    }
    static func == (lhs: YearMives, rhs: YearMives) -> Bool {
        return lhs.year == rhs.year
    }
}
