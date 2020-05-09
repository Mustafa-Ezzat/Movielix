//
//  MovieSearchCell.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import UIKit
import Cosmos

class MovieSearchCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var rateView: CosmosView!
    @IBOutlet weak var containerView: RoundedShadowView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configure(_ movie: Movie) {
        titleLabel.text = movie.title
        titleLabel.font = UIFont(fontStyle: .SFProDisplayBold, size: 20)
        yearLabel.text = "\(movie.year)"
        rateLabel.text = "(\(movie.rating))"
        rateView.rating = Double(movie.rating)
        handleColorMode()
    }
    
    func handleColorMode() {
        titleLabel.textColor = .primary
        yearLabel.textColor = .secondary
        rateLabel.textColor = .primary
        circleView.backgroundColor = .primary
        rateView.settings.filledColor = .primary
        rateView.settings.emptyBorderColor = .primary
        rateView.settings.filledBorderColor = .primary
        containerView.backgroundColor = .secondary
        arrowImageView.tintColor(with: .primary)
    }
}
