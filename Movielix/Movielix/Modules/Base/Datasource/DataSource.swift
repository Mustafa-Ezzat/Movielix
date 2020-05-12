//
//  DataSource.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/12/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import Foundation

protocol DataSource {
    associatedtype Element
    var list: [Element] {get set}
}
