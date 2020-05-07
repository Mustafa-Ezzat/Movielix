//
//  JsonReader.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation

protocol Reader {
    func read(completionHandler: @escaping (Result<MovieResponse, Error>) -> Void)
}

class JsonReader: Reader {
    func read(completionHandler: @escaping (Result<MovieResponse, Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            guard let path = Bundle.main.path(forResource: "movies", ofType: "json") else {
              preconditionFailure("Invalid data")
            }
            do {
              let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
              let movieResponsable = MovieResponsable()
              movieResponsable.map(data) { result in
                   completionHandler(result)
              }
            } catch {
               // handle error
              preconditionFailure("Invalid data")
            }
        }
    }
}
