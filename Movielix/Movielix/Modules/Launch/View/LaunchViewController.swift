//
//  ViewController.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/6/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import UIKit
import Lottie

class LaunchViewController: UIViewController {
    @IBOutlet weak var animationView: AnimationView!
    weak var coordinator: LaunchCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startAnimation()
        hideNavigation()
    }
    
    func startAnimation() {
        let animation = Animation.named("washinghands")
        animationView.contentMode = .scaleAspectFit
        animationView.animation = animation
        animationView.loopMode = .repeat(3)
        animationView.play { [weak self] _ in
            // use self instead of weakSelf based on airbnb guideline
            guard let self = self else {
                return
            }
            self.startSearchMovie()
        }
    }
    
    func startSearchMovie() {
        coordinator?.startSearchMovie()
    }
}


