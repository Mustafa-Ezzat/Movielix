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
        if #available(iOS 12.0, *) {
            if UIScreen.main.traitCollection.userInterfaceStyle == .dark {
                navigationBar.barTintColor = .black
                navigationBar.backgroundColor = .black
            }
        }

        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.primary, NSAttributedString.Key.font: UIFont(fontStyle: .SFProDisplayBold, size: 24)]
        navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
    }
    
}
