//
//  Catogrizer.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation

protocol Categorizer {
    associatedtype Input: Comparable & Hashable
    associatedtype Output: Comparable & Hashable
    func categorize(movies: Set<Input>, completion: @escaping ([Output]) -> Void)
}

class MovieCategorizer: Categorizer {
    typealias Input = Movie
    typealias Output = MoviesPerYear

    func categorize(movies: Set<Movie>, completion: @escaping ([MoviesPerYear]) -> Void) {
        let sorter = MovieSorter()
        let sorted = sorter.sort(list: Array(movies))
        let categoryDictionary = Dictionary(grouping: sorted) { $0.year }
        let movieList = categoryDictionary.map {MoviesPerYear(year: $0.key ?? 1900, movies: $0.value)}.sorted { $0 > $1 }
        completion(movieList)
    }
}
