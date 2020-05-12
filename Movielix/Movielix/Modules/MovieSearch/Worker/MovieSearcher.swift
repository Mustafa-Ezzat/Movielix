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
    func query(list: [MoviesPerYear], keyword: String) -> [MoviesPerYear] {
        var filterdResults = [MoviesPerYear]()
        for category in list {
            guard let movies = category.movies else {
                continue
            }
            let atMostTopRatedFive = movies.filter {$0.isExist(keyword)}.prefix(5)
            if !atMostTopRatedFive.isEmpty {
                let filteredCategory = MoviesPerYear(year: category.year, movies: Array(atMostTopRatedFive))
                filterdResults.append(filteredCategory)
            }
        }
        return filterdResults
    }
}
