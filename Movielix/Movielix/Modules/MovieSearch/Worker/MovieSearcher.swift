//
//  MovieSearcher.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation

protocol Searcher {
    associatedtype T
    associatedtype Keyword: Equatable
    func query(list: [T], keyword: Keyword) -> [T]
}

class MovieSearcher: Searcher {
    typealias T = YearMives<Int>
    typealias Keyword = String
    
    func query(list: [YearMives<Int>], keyword: String) -> [YearMives<Int>] {
        var filterdResults = [YearMives<Int>]()
        for category in list {
            let movies = category.movies.filter{$0.isExist(keyword)}.prefix(5)
            if !movies.isEmpty {
                let filteredCategory = YearMives(year: category.year, movies: Array(movies))
                filterdResults.append(filteredCategory)
            }
        }
        return filterdResults
    }
}
