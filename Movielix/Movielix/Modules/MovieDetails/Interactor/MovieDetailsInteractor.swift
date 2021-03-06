//
//  MovieDetailsInteractor.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation
import Moya

protocol MovieDetailsInteractorProtocol {
    func fetchPhotoList(movieTitle: String)
}

class MovieDetailsInteractor {
    let provider = MoyaProvider<MovieDetailsTarget>(callbackQueue: DispatchQueue.global(qos: .utility))
    var presenter: MovieDetailsPresenterProtocol?
}

extension MovieDetailsInteractor: MovieDetailsInteractorProtocol {
    func fetchPhotoList(movieTitle: String) {
        provider.request(.photoList(movieTitle: movieTitle)) { result in
            switch result {
            case .success(let response):
                do {
                    let decodableResponse = try response.map(FlickerContent.self)
                    self.presenter?.present(photos: decodableResponse)
                } catch {
                    self.presenter?.present(error: error.localizedDescription)
                }
            case .failure(let error):
                self.presenter?.present(error: error.localizedDescription)
            }
        }
    }
}
