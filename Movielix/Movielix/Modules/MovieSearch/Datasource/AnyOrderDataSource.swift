//
//  AnyOrderDataSource.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//
import UIKit

class AnyOrderDataSource: NSObject {
    var movies: [Movie]
    
    init(movies: [Movie]) {
        self.movies = movies
    }
}

extension AnyOrderDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieSearchCell = tableView.dequeueCell(for: indexPath)
        if movies.count > indexPath.row {
            let movie = movies[indexPath.row]
            cell.configure(movie)
        }
        return cell
    }
}

extension AnyOrderDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


