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
    
}

extension MovieSearchInteractor: MovieSearchInteractorProtocol {
    func readMovies(completionHandler: @escaping (Result<MovieResponse, Error>) -> Void) {
        guard let path = Bundle.main.path(forResource: "movies", ofType: "json") else {
           preconditionFailure("Invalid data")
        }
        do {
           let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
           let sut = MovieResponsable()
           sut.map(data) { result in
               completionHandler(result)
           }
        } catch {
            // handle error
           preconditionFailure("Invalid data")
        }
    }
}
