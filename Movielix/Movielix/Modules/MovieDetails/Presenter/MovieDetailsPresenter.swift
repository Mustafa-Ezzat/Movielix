//
//  MovieDetailsPresenter.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation

typealias MovieDetailsPresenterProtocol = FetchFlickrPhotoPresenterProtocol & BasePresenterProtocol

protocol FetchFlickrPhotoPresenterProtocol {
    func present(photos: FlickerContent)
}

class MovieDetailsPresenter {
    weak var view: MovieDetailsViewProtocol?
}

extension MovieDetailsPresenter: FetchFlickrPhotoPresenterProtocol {
    func present(photos: FlickerContent) {
        let list = photos.photos.photo.map {
            FlickrPhotoViewModel(model: $0)
        }
        view?.display(photos: list)
    }
}

extension MovieDetailsPresenter: BasePresenterProtocol {
    func present(error: String) {
        view?.display(error: error)
    }
}
