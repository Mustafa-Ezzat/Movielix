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
    
    init() {
        reader = JsonReader()
    }
    
    deinit {
        print("MovieSearchInteractor deinit successfully...")
    }
    func categorize(movies: [Movie], completion: @escaping ([YearMives]) -> Void) {
        let sorted = movies.sorted(by: { $0 > $1 })
        let categoryDictionary = Dictionary(grouping: sorted) { $0.year }
        let movieList = categoryDictionary.map{YearMives(year: $0.key, movies: $0.value) }.sorted(by: { $0 > $1 })
        completion(movieList)
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
                self.categorize(movies: response.movies) { list in
                    presenter.present(list: list)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
