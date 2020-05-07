//
//  LaunchCoordinator.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import UIKit

class LaunchCoordinator: Coordinator {
    var navigationController: UINavigationController
    var movieSearchCoordinator: MovieSearchCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = LaunchViewController.instintiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func startSearchMovie() {
        movieSearchCoordinator = MovieSearchCoordinator(navigationController: navigationController)
        movieSearchCoordinator?.start()
    }
}
