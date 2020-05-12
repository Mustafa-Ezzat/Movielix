//
//  MoviesPerYearViewModel.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/10/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation

struct MoviesPerYearViewModel {
    private var moviesPerYear: MoviesPerYear
    init(moviesPerYear: MoviesPerYear) {
        self.moviesPerYear = moviesPerYear
    }
    var year: Int {
        guard let year = moviesPerYear.year else {
            return 1970
        }
        return year
    }
    var movies: [MovieViewModel] {
        guard let movies = moviesPerYear.movies else {
            return []
        }
        let list = movies.map {
            MovieViewModel(movie: $0)
        }
        return list
    }
}
