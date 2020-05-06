//
//  MovieSearchViewController.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/6/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import UIKit

protocol MovieSearchViewProtocol {
    func display()
}

class MovieSearchViewController: UIViewController {
    var searchController: UISearchController!
    @IBOutlet weak var tableView: UITableView!
    weak var coordinator: MovieSearchCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Search"
        showNavigation()
        customizeSearchBar()
        setupTableView()
    }
    
    func customizeSearchBar() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search movies..."
        searchController.searchBar.tintColor = .primary
    }
    
    func setupTableView() {
        tableView.tableHeaderView = searchController.searchBar
    }
}

extension MovieSearchViewController: MovieSearchViewProtocol {
    func display() {
        
    }
}
