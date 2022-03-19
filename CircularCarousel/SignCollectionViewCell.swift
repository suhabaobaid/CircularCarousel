//
//  SignCollectionViewCell.swift
//  CarouselSmores
//
//  Created by Suha Baobaid on 3/18/22.
//

import UIKit

class SignCollectionViewCell: UICollectionViewCell {
    
    lazy var signImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .gray
        
        contentView.addSubview(signImageView)
        
        NSLayoutConstraint.activate([
            signImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            signImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            signImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            signImageView.heightAnchor.constraint(equalTo: signImageView.widthAnchor)
        ])
    }
}
