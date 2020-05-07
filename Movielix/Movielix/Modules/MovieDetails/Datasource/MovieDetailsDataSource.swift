//
//  MovieDetailsDataSource.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/8/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import UIKit

class MovieDetailsDataSource: NSObject, DataSource {
    typealias T = FlickrPhoto
    var list: [FlickrPhoto]

    init(list: [FlickrPhoto]) {
        self.list = list
    }
}

extension MovieDetailsDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FlickrPhotoCell = collectionView.dequeueCell(for: indexPath)
        let photo = list[indexPath.row]
        cell.configure(photo: photo)
        return cell
    }
}

extension MovieDetailsDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSideLength = (collectionView.bounds.width - 30) / 2
        return CGSize(width: cellSideLength, height: cellSideLength)
    }
}
