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
}

class MovieSearchPresenter {
    weak var view: MovieSearchViewProtocol?
    
    deinit {
        print("MovieSearchPresenter deinit successfully...")
    }
}

extension MovieSearchPresenter: MovieSearchPresenterProtocol {
    func present(list: [YearMives]) {
        view?.display(list: list)
    }
}