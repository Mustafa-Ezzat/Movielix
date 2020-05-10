//
//  MovieSearchPresenter.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation

protocol MovieSearchPresenterProtocol {
    func present(list: [YearMives])
    func present(list: [Movie])
}

class MovieSearchPresenter {
    weak var view: MovieSearchViewProtocol?
    
    deinit {
        print("MovieSearchPresenter deinit successfully...")
    }
}

extension MovieSearchPresenter: MovieSearchPresenterProtocol {
    func present(list: [YearMives]) {
        let list = list.map {
            YearMivesViewModel(yearMives: $0)
        }
        view?.display(list: list)
    }
    func present(list: [Movie]) {
        let list = list.map {
            MovieViewModel(movie: $0)
        }
        view?.display(list: list)
    }
}
