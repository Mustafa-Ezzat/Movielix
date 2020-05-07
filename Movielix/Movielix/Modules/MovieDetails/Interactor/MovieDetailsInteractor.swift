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
            switch(result) {
            case .success(let response):
                do {
                    print("Response: ", try response.mapString())
                    let decodableResponse = try response.map(FlickerContent.self)
                    self.presenter?.present(photos: decodableResponse)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

    }
}
