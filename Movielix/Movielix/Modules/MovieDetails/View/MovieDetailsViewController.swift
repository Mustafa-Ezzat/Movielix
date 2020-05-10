//
//  MovieDetailsViewController.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import UIKit
import Cosmos
import Lottie

protocol MovieDetailsViewProtocol: class {
    func display(photos: [FlickrPhotoViewModel])
}

class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var movieCircleView: UIView!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var castLabel: UILabel!
    @IBOutlet weak var genresStaticLabel: UILabel!
    @IBOutlet weak var castLaStaticbel: UILabel!
    @IBOutlet weak var imageErrorLabel: UILabel!
    @IBOutlet weak var photosCollectionView: UICollectionView!
    @IBOutlet weak var collectionHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var animationView: AnimationView!
    weak var coordinator: MovieDetailsCoordinator?
    var movie: MovieViewModel?
    var interactor: MovieDetailsInteractorProtocol?
    var datasource: MovieDetailsDataSource!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        handleOutlets()
        startAnimation()
        handleColorMode()
    }
    func handleColorMode() {
        yearLabel.textColor = .secondary
        movieCircleView.backgroundColor = .primary
        ratingView.settings.filledColor = .primary
        ratingView.settings.filledBorderColor = .primary
        ratingView.settings.emptyBorderColor = .primary
        genresLabel.textColor = .primary
        castLabel.textColor = .primary
        genresStaticLabel.textColor = .primary
        castLaStaticbel.textColor = .primary
        imageErrorLabel.textColor = .primary
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
        genresLabel.text = movie.genresList.joined(separator: "\n")
        castLabel.text = movie.castList.joined(separator: "\n")
    }
    func startAnimation() {
           let animation = Animation.named("stretch")
           animationView.contentMode = .scaleAspectFit
           animationView.animation = animation
           animationView.loopMode = .loop
           animationView.play { _ in
           }
    }
}

extension MovieDetailsViewController: MovieDetailsViewProtocol {
    func display(photos: [FlickrPhotoViewModel]) {
        datasource.list = photos
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.animationView.stop()
            self.animationView.isHidden = true
            guard !photos.isEmpty else {
                self.imageErrorLabel.isHidden = false
                return
            }
            self.photosCollectionView.reloadData()
            let contentHeight = self.photosCollectionView.collectionViewLayout.collectionViewContentSize.height
            self.collectionHeightConstraint.constant = contentHeight
        }
    }
}
