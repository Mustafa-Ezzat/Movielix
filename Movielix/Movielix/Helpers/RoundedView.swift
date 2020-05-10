//
//  RoundedView.swift
//  Movielix
//
//  Created by Mustafa Ezzat on 5/7/20.
//  Copyright © 2020 Swvl. All rights reserved.
//
import UIKit

@IBDesignable
class RoundedView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var borderWidth: CGFloat = 0
    @IBInspectable var borderColor: UIColor = .clear
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func prepareForInterfaceBuilder() {
        setup()
    }
    private func setup() {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        layer.masksToBounds = true
    }
}

class RoundedShadowView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    func setUp() {
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 6
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.139
    }
}
