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
    func display(list: [Movie], yearList: [YearMives<Int>])
}

enum DataSourceMode {
    case AnyOrder
    case Search
}

enum OrderMode {
    case AnyOrder
    case Ordered
}

class MovieSearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var animationView: AnimationView!
    var displayModeItem: UIBarButtonItem!
    var searchController: UISearchController!
    weak var coordinator: MovieSearchCoordinator?
    var interactor: MovieSearchInteractorProtocol?
    var yearMives: [YearMives<Int>]?
    var allyearMives: [YearMives<Int>]?
    var movies: [Movie]?
    var anyOrderdataSource: AnyOrderDataSource?
    var searchDataSource: MovieSearchDataSource?
    var orderMode: OrderMode!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Search"
        orderMode = .AnyOrder
        displayModeItem = UIBarButtonItem(title: "Ordered", style: .done, target: self, action: #selector(toggleDisplayMode))
        displayModeItem.isEnabled = false
        // self.navigationItem.rightBarButtonItem  = displayModeItem
        movies = [Movie]()
        showNavigation()
        customizeSearchBar()
        setupTableView()
        startAnimation()
    }
    
    deinit {
        print("MovieSearchViewController deinit successfully...")
    }
    
    @objc func toggleDisplayMode(){
        if orderMode == .AnyOrder {
            displayModeItem.title = "Any order"
            orderMode = .Ordered
        } else {
            displayModeItem.title = "Ordered"
            orderMode = .AnyOrder
        }
        toggleDisplayOrder(mode: orderMode)
    }
    
    func startAnimation() {
        let animation = Animation.named("smiley")
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
    
    func displayOrdered(with list: [YearMives<Int>]?) {
        guard let list = list else {
            return
        }
        self.searchDataSource?.list = list
        print(self.searchDataSource?.list ?? [])
        self.tableView.dataSource = self.searchDataSource
        self.tableView.delegate = self.searchDataSource
    }
    
    func toggleDisplayOrder(mode: OrderMode) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            switch mode {
            case .AnyOrder:
                self.displayAnyOrder()
            case .Ordered:
                self.displayOrdered(with: self.allyearMives)
            }
            self.tableView.reloadData()
        }
    }
    
    func reloadData(dataSourceMode: DataSourceMode) {
        DispatchQueue.main.async { [unowned self] in
            switch dataSourceMode {
            case .AnyOrder:
                self.displayModeItem.isEnabled = true
                self.displayAnyOrder()
            case .Search:
                self.displayModeItem.isEnabled = false
                self.displayOrdered(with: self.yearMives)
            }
            self.tableView.reloadData()
        }
    }
}

extension MovieSearchViewController: MovieSearchViewProtocol {
    func display(list: [Movie], yearList: [YearMives<Int>]) {
        movies = list
        self.allyearMives = yearList
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
