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
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MovieDetailsViewController.instintiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
