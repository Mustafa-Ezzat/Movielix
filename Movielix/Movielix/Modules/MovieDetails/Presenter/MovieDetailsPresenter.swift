//
//  MovieDetailsPresenter.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation

protocol MovieDetailsPresenterProtocol {
    func present(photos: FlickerContent)
}

class MovieDetailsPresenter {
    weak var view: MovieDetailsViewProtocol?
}

extension MovieDetailsPresenter: MovieDetailsPresenterProtocol {
    func present(photos: FlickerContent) {
        view?.display(photos: photos)
    }
}
