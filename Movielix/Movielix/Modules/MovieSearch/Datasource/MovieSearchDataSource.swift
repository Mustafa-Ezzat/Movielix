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
    typealias T = YearMives<Int>
    var list: [YearMives<Int>]
    
    init(list: [YearMives<Int>]) {
        self.list = list
    }
}

extension MovieSearchDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieSearchCell = tableView.dequeueCell(for: indexPath)
        if list.count > indexPath.row {
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
        guard let header: UITableViewHeaderFooterView = view as? UITableViewHeaderFooterView, let textLabel = header.textLabel  else {
            return
        }
        textLabel.textAlignment = .center
        textLabel.textColor = .white
        textLabel.font = UIFont(fontStyle: .SFProDisplayBold, size: 22)
    }

}

extension MovieSearchDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


