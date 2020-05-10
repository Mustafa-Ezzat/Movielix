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
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath)  as? T else {
            fatalError("init(nib:) has not been implemented")
        }
        return cell
    }
    func register<T: UICollectionViewCell>(cell: T.Type) {
        register(UINib(nibName: cell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: cell.reuseIdentifier)
    }
}
