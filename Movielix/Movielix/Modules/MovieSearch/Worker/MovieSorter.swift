//
//  Sorter.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation

protocol Sorter {
    associatedtype Element: Comparable
    func sort(list: [Element]) -> [Element]
}

class MovieSorter: Sorter {
    typealias Element = Movie
    func sort(list: [Movie]) -> [Movie] {
        return list.sorted(by: >)
    }
}
