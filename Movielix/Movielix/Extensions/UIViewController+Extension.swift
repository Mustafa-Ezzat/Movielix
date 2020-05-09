//
//  UIViewController+Extension.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/6/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import UIKit
extension UIViewController: ReusableView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

protocol XIB {
    static func instintiate() -> Self
}

extension XIB where Self: UIViewController {
    static func instintiate() -> Self {
        return self.init(nibName: self.defaultReuseIdentifier, bundle: nil)
    }
}

extension UIViewController: XIB {}

extension UIViewController {
    func hideNavigation() {
        navigationController?.navigationBar.isHidden = true
    }
    
    func showNavigation() {
        navigationController?.navigationBar.isHidden = false
    }
    
    func hideBackButtonTitle() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}


