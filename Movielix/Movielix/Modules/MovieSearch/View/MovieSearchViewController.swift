//
//  MovieSearchViewController.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/6/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import UIKit

protocol MovieSearchViewProtocol: class {
    func display(list: [YearMives])
}

class MovieSearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var searchController: UISearchController!
    weak var coordinator: MovieSearchCoordinator?
    var interactor: MovieSearchInteractorProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        interactor?.readMovies { _ in}
        title = "Search"
        showNavigation()
        customizeSearchBar()
        setupTableView()
    }
    
    deinit {
        print("MovieSearchViewController deinit successfully...")
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
    func display(list: [YearMives]) {
        print(list)
    }
}
