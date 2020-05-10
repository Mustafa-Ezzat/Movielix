//
//  MovieDetailsCoordinator.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import UIKit

class MovieDetailsCoordinator: Coordinator {
    var navigationController: UINavigationController
    var movie: MovieViewModel?
    init(navigationController: UINavigationController, movie: MovieViewModel) {
        self.navigationController = navigationController
        self.movie = movie
    }
    func start() {
        let movieDetailsViewController = MovieDetailsViewController.instintiate()
        let presenter = MovieDetailsPresenter()
        presenter.view = movieDetailsViewController
        let interactor = MovieDetailsInteractor()
        interactor.presenter = presenter
        movieDetailsViewController.interactor = interactor
        movieDetailsViewController.movie = movie
        movieDetailsViewController.coordinator = self
        navigationController.pushViewController(movieDetailsViewController, animated: true)
    }
}
