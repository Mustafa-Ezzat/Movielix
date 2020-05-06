//
//  Movie.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/6/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let title: String
    let year: Int
    let cast: [String]
    let genres: [String]
    let rating: Int
}
