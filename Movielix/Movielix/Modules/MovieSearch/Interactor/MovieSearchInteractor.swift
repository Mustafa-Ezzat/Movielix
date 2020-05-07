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
    func search(by keyword: String)
}

class MovieSearchInteractor {
    var presenter: MovieSearchPresenterProtocol?
    var reader: Reader?
    var categorizer: MovieCategorizer?
    var searcher: MovieSearcher?
    var list: [YearMives<Int>]?
    
    init() {
        // Single responsability one reason to change
        reader = JsonReader()
        categorizer = MovieCategorizer()
        searcher = MovieSearcher()
        list = [YearMives<Int>]()
    }
    
    deinit {
        print("MovieSearchInteractor deinit successfully...")
    }
}

extension MovieSearchInteractor: MovieSearchInteractorProtocol {
    func readMovies(completionHandler: @escaping (Result<MovieResponse, Error>) -> Void) {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            guard let self = self, let presenter = self.presenter else {
                return
            }
            self.reader?.read() {  result in
                switch result {
                case .success(let response):
                    let uniqueMovies = Set<Movie>(response.movies)
                    self.categorizer?.categorize(movies: uniqueMovies) { list in
                        self.list = list
                        presenter.present(list: response.movies, yearList: list)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func search(by keyword: String){
        DispatchQueue.global(qos: .utility).async { [weak self] in
            guard let self = self, let presenter = self.presenter else {
                return
            }
            guard let searcher = self.searcher, let list = self.list else {
                presenter.present(list: [YearMives<Int>]())
                return
            }
            let result = searcher.query(list: list, keyword: keyword)
            presenter.present(list: result)
        }
    }
}
