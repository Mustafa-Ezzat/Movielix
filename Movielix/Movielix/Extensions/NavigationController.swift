//
//  NavigationController.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/6/20.
//  Copyright © 2020 Swvl. All rights reserved.
//
import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        navigationBar.barTintColor = .primary
        navigationBar.backgroundColor = .primary
        navigationBar.tintColor = .white
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(fontStyle: .SFProDisplayBold, size: 24)]
        navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
    }
    
}
