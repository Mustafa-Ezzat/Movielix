//
//  MovieSearchPresenter.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation

protocol MovieSearchPresenterProtocol {
    func present(list: [YearMives<Int>])
    func present(list: [Movie], yearList: [YearMives<Int>])
}

class MovieSearchPresenter {
    weak var view: MovieSearchViewProtocol?
    
    deinit {
        print("MovieSearchPresenter deinit successfully...")
    }
}

extension MovieSearchPresenter: MovieSearchPresenterProtocol {
    func present(list: [YearMives<Int>]) {
        view?.display(list: list)
    }
    func present(list: [Movie], yearList: [YearMives<Int>]) {
        view?.display(list: list, yearList: yearList)
    }
}
