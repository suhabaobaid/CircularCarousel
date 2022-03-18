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
            signImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            signImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            signImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
