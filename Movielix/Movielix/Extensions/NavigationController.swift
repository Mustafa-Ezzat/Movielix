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
        navigationBar.tintColor = .primary
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.primary, NSAttributedString.Key.font: UIFont(fontStyle: .SFProDisplayBold, size: 24)]
        navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
    }
    
}
