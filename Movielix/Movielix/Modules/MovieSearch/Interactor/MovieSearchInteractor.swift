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
    func fetchMovies()
    func search(by keyword: String)
}

class MovieSearchInteractor {
    var presenter: MovieSearchPresenterProtocol?
    var reader: Reader?
    var categorizer: MovieCategorizer?
    var searcher: MovieSearcher?
    var list: [YearMives]?
    var realmWorker: RealmWorker?
    
    init() {
        // Single responsability one reason to change
        reader = JsonReader()
        categorizer = MovieCategorizer()
        searcher = MovieSearcher()
        list = [YearMives]()
        realmWorker = RealmWorker()
    }
    
    deinit {
        print("MovieSearchInteractor deinit successfully...")
    }
    
    func categorize(_ movies: [Movie]) {
        guard let presenter = self.presenter, let realmWorker = self.realmWorker else {
            return
        }
        let uniqueMovies = Set<Movie>(movies)
        self.categorizer?.categorize(movies: uniqueMovies) { list in
            self.list = list
            DispatchQueue.main.async {
                realmWorker.save(contentsOf: movies)
                realmWorker.save(contentsOf: list)
                UserDefaults.standard.set(true, forKey: "movielix.cashing")
            }
            presenter.present(list: movies)
        }
    }
}

extension MovieSearchInteractor: MovieSearchInteractorProtocol {
    func fetchMovies() {
        guard let presenter = self.presenter, let realmWorker = self.realmWorker else {
            return
        }
        list = realmWorker.find(object: YearMives.self).all()
        presenter.present(list: realmWorker.find(object: Movie.self).all())
    }
    
    func readMovies(completionHandler: @escaping (Result<MovieResponse, Error>) -> Void) {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            guard let self = self else {
                return
            }
            self.reader?.read() {  result in
                switch result {
                case .success(let response):
                    self.categorize(response.movies)
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
                presenter.present(list: [YearMives]())
                return
            }
            let result = searcher.query(list: list, keyword: keyword)
            presenter.present(list: result)
        }
    }
}
