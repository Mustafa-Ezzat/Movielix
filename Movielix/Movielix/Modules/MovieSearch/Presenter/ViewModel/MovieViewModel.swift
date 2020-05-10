//
//  MovieViewModel.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/10/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation

struct MovieViewModel {
    private let movie: Movie
    init(movie: Movie) {
        self.movie = movie
    }
    var title: String {
        guard let title = movie.title else {
            return ""
        }
        return title
    }
    var year: Int {
        guard let year = movie.year else {
            return 1900
        }
        return year
    }
    var castList: [String] {
        guard let list = movie.cast else {
            return []
        }
        return list
    }
    var genresList: [String] {
        guard let list = movie.genres else {
            return []
        }
        return list
    }
    var rating: Int {
        guard let year = movie.year else {
            return 0
        }
        return year
    }
}
