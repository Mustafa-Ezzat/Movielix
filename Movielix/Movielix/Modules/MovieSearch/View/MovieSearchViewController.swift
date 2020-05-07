//
//  MovieSearchViewController.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/6/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import UIKit
import Lottie

protocol MovieSearchViewProtocol: class {
    func display(list: [YearMives<Int>])
    func display(list: [Movie])
}

enum DataSourceMode {
    case AnyOrder
    case Search
}

class MovieSearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var animationView: AnimationView!
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
        startAnimation()
    }
    
    deinit {
        print("MovieSearchViewController deinit successfully...")
    }
    
    func startAnimation() {
        let animation = Animation.named("stretch")
        animationView.contentMode = .scaleAspectFit
        animationView.animation = animation
        animationView.play { [unowned self]  _ in
            self.interactor?.readMovies { _ in}
        }
    }
    
    func customizeSearchBar() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search movies..."
        searchController.searchBar.tintColor = .primary
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
    }
    
    func setupTableView() {
        anyOrderdataSource = AnyOrderDataSource(list: [])
        anyOrderdataSource?.view = self
        searchDataSource = MovieSearchDataSource(list: [])
        searchDataSource?.view = self
        tableView.tableHeaderView = searchController.searchBar
        tableView.register(cell: MovieSearchCell.self)
        tableView.dataSource = anyOrderdataSource
        tableView.delegate = anyOrderdataSource
    }
    
    func reloadData(dataSourceMode: DataSourceMode) {
    DispatchQueue.main.async { [unowned self] in
        switch dataSourceMode {
        case .AnyOrder:
            guard let list = self.movies else {
                return
            }
            self.anyOrderdataSource?.list = list
            self.tableView.dataSource = self.anyOrderdataSource
            self.tableView.delegate = self.anyOrderdataSource
            self.animationView.isHidden = true
        case .Search:
            guard let list = self.yearMives else {
                return
            }
            self.searchDataSource?.list = list
            self.tableView.dataSource = self.searchDataSource
            self.tableView.delegate = self.searchDataSource
        }
            self.tableView.reloadData()
        }
    }
}

extension MovieSearchViewController: MovieSearchViewProtocol {
    func display(list: [Movie]) {
        movies = list
        reloadData(dataSourceMode: .AnyOrder)
    }
    func display(list: [YearMives<Int>]) {
        yearMives = list
        reloadData(dataSourceMode: .Search)
    }
}

extension MovieSearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let keyword = searchController.searchBar.text, !keyword.isEmpty else {
            reloadData(dataSourceMode: .AnyOrder)
            return
        }
        interactor?.search(by: keyword)
    }
}
