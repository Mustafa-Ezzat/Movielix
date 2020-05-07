//
//  MovieSearchInteractor.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/6/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation

protocol MovieSearchInteractorProtocol {
    func readMovies(completionHandler: @escaping (Result<MovieResponse, Error>) -> Void)
}

class MovieSearchInteractor {
    var presenter: MovieSearchPresenterProtocol?
    deinit {
        print("MovieSearchInteractor deinit successfully...")
    }
}

extension MovieSearchInteractor: MovieSearchInteractorProtocol {
    func readMovies(completionHandler: @escaping (Result<MovieResponse, Error>) -> Void) {
        guard let path = Bundle.main.path(forResource: "movies", ofType: "json") else {
           preconditionFailure("Invalid data")
        }
        do {
           let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
           let movieResponsable = MovieResponsable()
           movieResponsable.map(data) { result in
                completionHandler(result)
                guard let presenter = self.presenter else {
                    return
                }
                presenter.present()
           }
        } catch {
            // handle error
           preconditionFailure("Invalid data")
        }
    }
}
