//
//  MovieSearchPresenter.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation

typealias MovieSearchPresenterProtocol = MoviesPerYearPresenterProtocol & MovieListPresenterProtocol & BasePresenterProtocol

protocol MoviesPerYearPresenterProtocol {
    func present(list: [MoviesPerYear])
}

protocol MovieListPresenterProtocol {
    func present(list: [Movie])
}

class MovieSearchPresenter {
    weak var view: MovieSearchViewProtocol?
    deinit {
        print("MovieSearchPresenter deinit successfully...")
    }
}

extension MovieSearchPresenter: MovieListPresenterProtocol {
    func present(list: [Movie]) {
        let list = list.map {
            MovieViewModel(movie: $0)
        }
        view?.display(list: list)
    }
}
extension MovieSearchPresenter: MoviesPerYearPresenterProtocol {
    func present(list: [MoviesPerYear]) {
        let list = list.map {
            MoviesPerYearViewModel(moviesPerYear: $0)
        }
        view?.display(list: list)
    }
}
//
extension MovieSearchPresenter: BasePresenterProtocol {
    func present(error: String) {
        view?.display(error: error)
    }
}
