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
    func display(list: [YearMivesViewModel])
    func display(list: [MovieViewModel])
}

enum DataSourceMode {
    case anyOrder
    case search
}

class MovieSearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var animationView: AnimationView!
    var searchController: UISearchController!
    weak var coordinator: MovieSearchCoordinator?
    var interactor: MovieSearchInteractorProtocol?
    var yearMives: [YearMivesViewModel]?
    var movies: [MovieViewModel]?
    var anyOrderdataSource: AnyOrderDataSource?
    var searchDataSource: MovieSearchDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        customizeUserInteface()
        fetchMovieList()
    }
    deinit {
        print("MovieSearchViewController deinit successfully...")
    }
    func customizeUserInteface() {
        title = "Search"
        hideBackButtonTitle()
        movies = [MovieViewModel]()
        showNavigation()
        customizeSearchBar()
        setupTableView()
    }
    func fetchMovieList() {
        if let movieIscashing = UserDefaults.standard.value(forKey: "movielix.cashing") as? Bool, movieIscashing {
            interactor?.fetchMovies()
        } else {
            startAnimation()
        }
    }
    func startAnimation() {
        let animation = Animation.named("washinghands")
        animationView.contentMode = .scaleAspectFit
        animationView.animation = animation
        animationView.play { [unowned self] _ in
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
    func displayAnyOrder() {
        guard let list = self.movies else {
            return
        }
        self.anyOrderdataSource?.list = list
        self.tableView.dataSource = self.anyOrderdataSource
        self.tableView.delegate = self.anyOrderdataSource
        self.animationView.isHidden = true
    }
    func displayOrdered(with list: [YearMivesViewModel]?) {
        guard let list = list else {
            return
        }
        self.searchDataSource?.list = list
        print(self.searchDataSource?.list ?? [])
        self.tableView.dataSource = self.searchDataSource
        self.tableView.delegate = self.searchDataSource
    }
    func reloadData(dataSourceMode: DataSourceMode) {
        DispatchQueue.main.async { [unowned self] in
            switch dataSourceMode {
            case .anyOrder:
                self.displayAnyOrder()
            case .search:
                self.displayOrdered(with: self.yearMives)
            }
            self.tableView.reloadData()
        }
    }
}

extension MovieSearchViewController: MovieSearchViewProtocol {
    func display(list: [MovieViewModel]) {
        movies = list
        reloadData(dataSourceMode: .anyOrder)
    }
    func display(list: [YearMivesViewModel]) {
        yearMives = list
        reloadData(dataSourceMode: .search)
    }
}

extension MovieSearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let keyword = searchController.searchBar.text, !keyword.isEmpty else {
            reloadData(dataSourceMode: .anyOrder)
            return
        }
        interactor?.search(by: keyword)
    }
}
