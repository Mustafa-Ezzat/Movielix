//
//  UIImageView+Extension.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/9/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import UIKit

extension UIImageView {
    func tintColor(with color: UIColor) {
        self.image = self.image?.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
}
