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

    class func instintiateFromNib() -> UIViewController {
        return self.init(nibName: self.defaultReuseIdentifier, bundle: nil)
    }

    func hideNavigation() {
        navigationController?.navigationBar.isHidden = true
    }
    
    func showNavigation() {
        navigationController?.navigationBar.isHidden = false
    }
    
    func setRoot(vc: UIViewController) {
        guard let keyWindow = UIApplication.shared.keyWindow else {
            return
        }
        keyWindow.rootViewController = vc
        keyWindow.makeKeyAndVisible()
    }
}


