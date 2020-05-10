//
//  Movie.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/6/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation
import Unrealm

struct Movie: Codable {
    let title: String?
    let year: Int?
    let cast: [String]?
    let genres: [String]?
    let rating: Int?
}

extension Movie: Comparable & Hashable {
    static func < (lhs: Movie, rhs: Movie) -> Bool {
        guard let lhsRating = lhs.rating, let rhsRating = rhs.rating else {
            return false
        }
        return lhsRating < rhsRating
    }
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.title == rhs.title && lhs.year == rhs.year
    }
}

protocol Searchable {
    associatedtype Keyword: Equatable
    func isExist(_ keyword: Keyword) -> Bool
}

extension Movie: Searchable {
    typealias Keyword = String
    func isExist(_ keyword: String) -> Bool {
        guard let title = title else {
            return false
        }
        return title.lowercased().contains(keyword.lowercased())
    }
}

extension Movie: Realmable {
    init() {
        title = ""
        year = 0
        cast = [String]()
        genres = [String]()
        rating = 0
    }
}
