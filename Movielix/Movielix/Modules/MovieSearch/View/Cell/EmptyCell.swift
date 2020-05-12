//
//  EmptyCell.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/12/20.
//  Copyright © 2020 Swvl. All rights reserved.
//

import UIKit

class EmptyCell: UITableViewCell {
    @IBOutlet weak var emptyLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure() {
        emptyLabel.textColor = .primary
    }
}
