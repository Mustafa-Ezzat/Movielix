//
//  UIColor+Extension.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/6/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import UIKit

extension UIColor {
    static let mainColor = rgba(69, 39, 160)
    static let mainDarkColor = rgba(13, 0, 28)
    
    static var primary: UIColor {
        if #available(iOS 12.0, *) {
            return UIScreen.main.traitCollection.userInterfaceStyle == .light ? mainColor : .white
        } else {
            // Fallback on earlier versions
            return mainColor
        }
    }
    
    static var secondary: UIColor {
        if #available(iOS 12.0, *) {
            return UIScreen.main.traitCollection.userInterfaceStyle == .light ? .white : mainDarkColor
        } else {
            // Fallback on earlier versions
            return .white
        }
    }

    static func rgba(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
    }
    
    static func hex(_ rgbValue: UInt32, alpha: CGFloat = 1.0) -> UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8) / 256.0
        let blue = CGFloat(rgbValue & 0xFF) / 256.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
