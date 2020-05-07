//
//  MovieSearchDataSource.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import UIKit

class MovieSearchDataSource: NSObject {
    var movies: [YearMives<Int>]
    
    init(movies: [YearMives<Int>]) {
        self.movies = movies
    }
}

extension MovieSearchDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return movies.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies[section].movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieSearchCell = tableView.dequeueCell(for: indexPath)
        if movies.count > indexPath.row {
            let movie = movies[indexPath.section].movies[indexPath.row]
            cell.configure(movie)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(movies[section].year)"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = .primary
        guard let header: UITableViewHeaderFooterView = view as? UITableViewHeaderFooterView, let textLabel = header.textLabel  else {
            return
        }
        textLabel.textAlignment = .center
        textLabel.textColor = .white
    }

}

extension MovieSearchDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


