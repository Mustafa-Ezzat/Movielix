//
//  MovieSearchViewController.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/6/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import UIKit

class MovieSearchViewController: UIViewController {
    var searchController: UISearchController!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Search"
        searchController = UISearchController(searchResultsController: nil)
        customizeSearchBar()
        tableView.tableHeaderView = searchController.searchBar
    }
    
    func customizeSearchBar() {
        searchController.searchBar.placeholder = "Search movies..."
        searchController.searchBar.tintColor = .primary
    }
}
