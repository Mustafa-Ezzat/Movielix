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
    var reader: Reader?
    var categorizer: MovieCategorizer?
    
    init() {
        // Single responsability one reason to change
        reader = JsonReader()
        categorizer = MovieCategorizer()
    }
    
    deinit {
        print("MovieSearchInteractor deinit successfully...")
    }
}

extension MovieSearchInteractor: MovieSearchInteractorProtocol {
    func readMovies(completionHandler: @escaping (Result<MovieResponse, Error>) -> Void) {
        reader?.read() { [weak self] result in
            guard let self = self, let presenter = self.presenter else {
                return
            }
            switch result {
            case .success(let response):
                self.categorizer?.categorize(movies: response.movies) { list in
                    presenter.present(list: list)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
