//
//  YearMivesViewModel.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/10/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation

struct YearMivesViewModel {
    private var yearMives: YearMives
    init(yearMives: YearMives) {
        self.yearMives = yearMives
    }
    var year: Int {
        guard let year = yearMives.year else {
            return 1970
        }
        return year
    }
    var movies: [MovieViewModel] {
        guard let movies = yearMives.movies else {
            return []
        }
        let list = movies.map {
            MovieViewModel(movie: $0)
        }
        return list
    }
}
