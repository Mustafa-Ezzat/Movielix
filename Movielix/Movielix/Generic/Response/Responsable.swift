//
//  Responsable.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/6/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation

protocol Responsable {
    associatedtype T
    func map(_ data: Data, completion: @escaping (Result<T, Error>) -> Void)
}

extension Responsable where T: Decodable {
    func map(_ data: Data, completion: @escaping (Result<T, Error>) -> Void) {
        do {
            let decodableResponse = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decodableResponse))
        } catch {
            completion(.failure(error))
        }
    }
}
