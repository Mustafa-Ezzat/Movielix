//
//  FlickrPhotoCell.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/8/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import UIKit
import Nuke

class FlickrPhotoCell: UICollectionViewCell {
    @IBOutlet weak var flickrImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(photo: FlickrPhoto) {
        let options = ImageLoadingOptions(
            placeholder: UIImage(named: "logo"),
            transition: .fadeIn(duration: 0.33),
            failureImage: UIImage(named: "logo"),
            contentModes: .init(success: .scaleAspectFill, failure: .scaleAspectFit, placeholder: .scaleAspectFit)
        )
        Nuke.loadImage(with: photo.imageUrl!, options: options, into: flickrImageView)
    }
}
