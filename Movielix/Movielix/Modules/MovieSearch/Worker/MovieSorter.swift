//
//  Sorter.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation

protocol Sorter {
    associatedtype T: Comparable
    func sort(list: [T]) -> [T]
}

class MovieSorter: Sorter {
    typealias T = Movie
    
    func sort(list: [Movie]) -> [Movie] {
        return list.sorted(by: >)
    }
}
