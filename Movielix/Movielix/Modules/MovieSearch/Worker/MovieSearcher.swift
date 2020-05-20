//
//  MovieSearcher.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation

protocol Searcher {
    associatedtype Element
    associatedtype Keyword: Equatable
    func query(list: [Element], keyword: Keyword) -> [Element]
}

class MovieSearcher: Searcher {
    typealias Element = MoviesPerYear
    typealias Keyword = String
    func moviesPerYear(moviesPerYear: MoviesPerYear, keyword: String) -> MoviesPerYear? {
        guard let movies = moviesPerYear.movies else {
            return nil
        }
        let atMostTopRatedFive = movies.filter {$0.isExist(keyword)}.prefix(5)
        return atMostTopRatedFive.isEmpty ? nil : MoviesPerYear(year: moviesPerYear.year, movies: Array(atMostTopRatedFive))
    }
    func query(list: [MoviesPerYear], keyword: String) -> [MoviesPerYear] {
        let filterdResults = list.compactMap {
            moviesPerYear(moviesPerYear: $0, keyword: keyword)
        }
        return filterdResults
    }
}
