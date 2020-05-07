//
//  MovieSearchCoordinator.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import UIKit

class MovieSearchCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("MovieSearchCoordinator deinit successfully...")
    }
    
    func start() {
        let view = MovieSearchViewController.instintiate()
        view.coordinator = self
        let presenter = MovieSearchPresenter()
        presenter.view = view
        let interactor = MovieSearchInteractor()
        interactor.presenter = presenter
        view.interactor = interactor
        navigationController.pushViewController(view, animated: true)
    }
}
