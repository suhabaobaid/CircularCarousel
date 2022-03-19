//
//  BodyLabel.swift
//  CircularCarousel
//
//  Created by Suha Baobaid on 3/19/22.
//

import UIKit

class BodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(headingText: String, textColor: UIColor = .white, textAlignment: NSTextAlignment = .left) {
        self.init(frame: .zero)
        text = headingText
        self.textColor = textColor
        self.textAlignment = textAlignment
    }
    
    private func configure() {
        textColor = .white
        font = UIFont.preferredFont(forTextStyle: .body)
        textAlignment = .left
        numberOfLines = 0
        translatesAutoresizingMaskIntoConstraints = false
    }

}
