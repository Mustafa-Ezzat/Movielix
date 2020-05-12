//
//  BaseViewController.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/12/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import UIKit

protocol BaseViewProtocol: class {
    func display(error: String)
}

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension BaseViewController: BaseViewProtocol {
    func display(error: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.showAlert(with: "", and: error)
        }
    }
}
