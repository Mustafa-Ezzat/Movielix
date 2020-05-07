//
//  MovieDetailsViewController.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import UIKit
import Cosmos

protocol MovieDetailsViewProtocol: class {
    func display(photos: FlickerContent)
}

class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var castLabel: UILabel!
    @IBOutlet weak var photosCollectionView: UICollectionView!
    @IBOutlet weak var photosCollectionViewHeightConstraint: NSLayoutConstraint!
    weak var coordinator: MovieDetailsCoordinator?
    var movie: Movie?
    var interactor: MovieDetailsInteractorProtocol?
    var datasource: MovieDetailsDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        handleOutlets()
    }
    
    func handleOutlets() {
        guard let movie = movie else {
            return
        }
        datasource = MovieDetailsDataSource(list: [])
        photosCollectionView.register(cell: FlickrPhotoCell.self)
        photosCollectionView.dataSource = datasource
        photosCollectionView.delegate = datasource
        title = movie.title
        interactor?.fetchPhotoList(movieTitle: movie.title)
        yearLabel.text = "\(movie.year)"
        ratingView.rating = Double(movie.rating)
        genresLabel.text = movie.genres.joined(separator: "\n")
        castLabel.text = movie.cast.joined(separator: "\n")
    }
}

extension MovieDetailsViewController: MovieDetailsViewProtocol {
    func display(photos: FlickerContent) {
        datasource.list = photos.photos.photo
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.photosCollectionView.reloadData()
            self.photosCollectionViewHeightConstraint.constant = self.photosCollectionView.collectionViewLayout.collectionViewContentSize.height
        }
    }
}
