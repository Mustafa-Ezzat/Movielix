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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let animation = Animation.named("stay-home-stay-safe")
        animationView.contentMode = .scaleAspectFit
        animationView.animation = animation
        animationView.play { _ in
            print("Animation done ... ")
        }
    }

}

