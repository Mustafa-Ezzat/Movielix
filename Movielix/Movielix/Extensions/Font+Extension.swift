//
//  Font+Extension.swift
//  iqproject
//
//  Created by Margret Yehia on 4/18/20.
//  Copyright © 2020 Vortex. All rights reserved.
//

import UIKit

enum FontStyle: String {
    case SFProDisplayThin     = "SFProDisplay-Thin"
    case SFProDisplayLight    = "SFProDisplay-Light"
    case SFProDisplayBold     = "SFProDisplay-Bold"
    case SFProDisplayMedium   = "SFProDisplay-Medium"
    case SFProDisplayRegular  = "SFProDisplay-Regular"
    case SFProDisplaySemibold = "SFProDisplay-Semibold"
    case RobotoLight          = "Roboto-Light"
}
extension UIFont {
    convenience init?(fontStyle: FontStyle, size: CGFloat) {
        self.init(name: fontStyle.rawValue, size: size)
    }
}
