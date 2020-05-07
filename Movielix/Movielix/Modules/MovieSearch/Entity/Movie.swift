//
//  Movie.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/6/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let title: String
    let year: Int
    let cast: [String]
    let genres: [String]
    let rating: Int
}

extension Movie: Comparable {
    static func < (lhs: Movie, rhs: Movie) -> Bool {
        lhs.rating < rhs.rating
    }
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.title == rhs.title && lhs.year == rhs.year
    }
}
