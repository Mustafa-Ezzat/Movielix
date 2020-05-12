//
//  Coordinator.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import UIKit

protocol Coordinator {
    // no need for childCoordinators in this release
    // var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController {get set}
    func start()
}
