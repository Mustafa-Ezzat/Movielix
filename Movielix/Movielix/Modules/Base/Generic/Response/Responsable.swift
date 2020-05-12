//
//  Responsable.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/6/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation

protocol Responsable {
    associatedtype Model
    func map(_ data: Data, completion: @escaping (Result<Model, Error>) -> Void)
}

extension Responsable where Model: Decodable {
    func map(_ data: Data, completion: @escaping (Result<Model, Error>) -> Void) {
        do {
            let decodableResponse = try JSONDecoder().decode(Model.self, from: data)
            completion(.success(decodableResponse))
        } catch {
            completion(.failure(error))
        }
    }
}
