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
    typealias T = YearMives
    typealias Keyword = String
    
    func query(list: [YearMives], keyword: String) -> [YearMives] {
        var filterdResults = [YearMives]()
        for category in list {
            guard let movies = category.movies else {
                continue
            }
            let atMostTopRatedFive = movies.filter{$0.isExist(keyword)}.prefix(5)
            if !atMostTopRatedFive.isEmpty {
                let filteredCategory = YearMives(year: category.year, movies: Array(atMostTopRatedFive))
                filterdResults.append(filteredCategory)
            }
        }
        return filterdResults
    }
}
