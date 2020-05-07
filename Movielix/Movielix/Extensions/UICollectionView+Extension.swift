//
//  UICollectionView+Extension.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/8/20.
//  Copyright © 2020 Swvl. All rights reserved.
//


import UIKit

extension UICollectionView {
    
    func dequeueCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as! T
    }
    
    func register<T: UICollectionViewCell>(cell: T.Type) {
        register(UINib(nibName: cell.defaultReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: cell.defaultReuseIdentifier)
    }
}
