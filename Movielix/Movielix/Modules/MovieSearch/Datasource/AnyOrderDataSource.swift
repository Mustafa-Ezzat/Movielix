//
//  AnyOrderDataSource.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//
import UIKit

class AnyOrderDataSource: NSObject, DataSource {
    typealias T = MovieViewModel
    var list: [MovieViewModel]
    weak var view: MovieSearchViewController?

    init(list: [MovieViewModel]) {
        self.list = list
    }
}

extension AnyOrderDataSource: UITableViewDataSource {
    func validIndex(_ indexPath: IndexPath) -> Bool {
        guard indexPath.row < list.count  else {
            return false
        }
        return true
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieSearchCell = tableView.dequeueCell(for: indexPath)
        if validIndex(indexPath) {
            let movie = list[indexPath.row]
            cell.configure(movie)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension AnyOrderDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if validIndex(indexPath) {
            let movie = list[indexPath.row]
            self.view?.coordinator?.starthMovieDetails(movie: movie)
        }
    }
}


