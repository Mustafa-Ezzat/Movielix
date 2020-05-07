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
    var movie: Movie?
    
    init(navigationController: UINavigationController, movie: Movie) {
        self.navigationController = navigationController
        self.movie = movie
    }
    
    func start() {
        let vc = MovieDetailsViewController.instintiate()
        let presenter = MovieDetailsPresenter()
        presenter.view = vc
        let interactor = MovieDetailsInteractor()
        interactor.presenter = presenter
        vc.interactor = interactor
        vc.movie = movie
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
