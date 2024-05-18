//
//  GFTitleLabel.swift
//  GithubFollowers
//
//  Created by Soumik Sen on 11/05/24.
//

import UIKit

class GFTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configure()
    }

    private func configure() {
        textColor = .label  //Black on light screen, light on dark screen
        adjustsFontSizeToFitWidth = true    //Shrinks text a little bit to fit size
        minimumScaleFactor = 0.9    // Says how much it is allowed to shrink
        lineBreakMode = .byTruncatingTail   //If username is too long then it truncates tailend by ...
        translatesAutoresizingMaskIntoConstraints = false
    }

}
