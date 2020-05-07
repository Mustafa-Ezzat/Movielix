//
//  MovieSearchViewController.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/6/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import UIKit

protocol MovieSearchViewProtocol: class {
    func display(list: [YearMives<Int>])
    func display(list: [Movie])
}

class MovieSearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var searchController: UISearchController!
    weak var coordinator: MovieSearchCoordinator?
    var interactor: MovieSearchInteractorProtocol?
    var yearMives: [YearMives<Int>]?
    var movies: [Movie]?
    var anyOrderdataSource: AnyOrderDataSource?
    var searchDataSource: MovieSearchDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        movies = [Movie]()
        title = "Search"
        showNavigation()
        customizeSearchBar()
        setupTableView()
        interactor?.readMovies { _ in}
    }
    
    deinit {
        print("MovieSearchViewController deinit successfully...")
    }
    
    func customizeSearchBar() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search movies..."
        searchController.searchBar.tintColor = .primary
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
    }
    
    func setupTableView() {
        anyOrderdataSource = AnyOrderDataSource(movies: [])
        searchDataSource = MovieSearchDataSource(movies: [])
        tableView.tableHeaderView = searchController.searchBar
        tableView.register(cell: MovieSearchCell.self)
        tableView.dataSource = anyOrderdataSource
        tableView.delegate = anyOrderdataSource
    }
}

extension MovieSearchViewController: MovieSearchViewProtocol {
    func display(list: [Movie]) {
        movies = list
        anyOrderdataSource?.movies = list
        tableView.dataSource = anyOrderdataSource
        tableView.delegate = anyOrderdataSource
        tableView.reloadData()
    }
    
    func display(list: [YearMives<Int>]) {
        yearMives = list
        searchDataSource?.movies = list
        tableView.dataSource = searchDataSource
        tableView.delegate = searchDataSource
        tableView.reloadData()
    }
}

extension MovieSearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let keyword = searchController.searchBar.text, !keyword.isEmpty else {
            anyOrderdataSource?.movies = movies!
            tableView.dataSource = anyOrderdataSource
            tableView.delegate = anyOrderdataSource
            tableView.reloadData()
            return
        }
        interactor?.search(by: keyword)
    }
}
