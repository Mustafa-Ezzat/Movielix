//
//  AnyOrderDataSource.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//
import UIKit

class AnyOrderDataSource: NSObject, DataSource {
    typealias T = Movie
    
    var list: [Movie]
    
    init(list: [Movie]) {
        self.list = list
    }
}

extension AnyOrderDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieSearchCell = tableView.dequeueCell(for: indexPath)
        if list.count > indexPath.row {
            let movie = list[indexPath.row]
            cell.configure(movie)
        }
        return cell
    }
}

extension AnyOrderDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


