//
//  MovieSearchDataSource.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import UIKit

protocol DataSource {
    associatedtype T
    var list: [T] {get set}
}

class MovieSearchDataSource: NSObject, DataSource {
    typealias T = YearMives
    var list: [YearMives]
    weak var view: MovieSearchViewController?
    
    init(list: [YearMives]) {
        self.list = list
    }
}

extension MovieSearchDataSource: UITableViewDataSource {
    func validIndex(_ indexPath: IndexPath) -> Bool {
        guard indexPath.section < list.count, indexPath.row < list[indexPath.section].movies.count else {
            return false
        }
        return true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieSearchCell = tableView.dequeueCell(for: indexPath)
        if validIndex(indexPath) {
            let movie = list[indexPath.section].movies[indexPath.row]
            cell.configure(movie)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(list[section].year)"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = .primary
        view.backgroundColor = .primary
        guard let header: UITableViewHeaderFooterView = view as? UITableViewHeaderFooterView, let textLabel = header.textLabel  else {
            return
        }
        textLabel.textAlignment = .center
        textLabel.textColor = .secondary
        textLabel.font = UIFont(fontStyle: .SFProDisplayBold, size: 22)
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension MovieSearchDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if validIndex(indexPath) {
            let movie = list[indexPath.section].movies[indexPath.row]
            view?.searchController.dismiss(animated: true) { [unowned self] in
                self.view?.coordinator?.starthMovieDetails(movie: movie)
            }
        }
    }
}


