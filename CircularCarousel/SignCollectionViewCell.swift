//
//  SignCollectionViewCell.swift
//  CarouselSmores
//
//  Created by Suha Baobaid on 3/18/22.
//

import UIKit

class SignCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI
    lazy var signImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var signLabel: TitleLabel = {
        var label = TitleLabel(headingText: "", textColor: .white, textAlignment: .center)
        return label
    }()
    lazy var dateLabel: FootNoteLabel = {
        var label = FootNoteLabel(bodyText: "", textColor: .white, textAlignment: .center)
        return label
    }()
    lazy var selectButton: UIButton = {
       var button = UIButton()
        button.setTitle("CONTINUE", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        button.tintColor = .white
        button.layer.cornerRadius = 14
        button.clipsToBounds = true
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Properties
    var isHoroscopeSelected: Bool = false {
        didSet {
            isHoroscopeSelected ? setSelected() : setDeselected()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        selectButton.isHidden = true
    }
    
    private func configure() {
        backgroundColor = .clear
        contentView.clipsToBounds = false
        
        contentView.addSubview(signImageView)
        contentView.addSubview(signLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(selectButton)
     
        
        NSLayoutConstraint.activate([
            signImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            signImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            signImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
            signImageView.heightAnchor.constraint(equalTo: signImageView.widthAnchor),
            
            signLabel.topAnchor.constraint(equalTo: signImageView.bottomAnchor, constant: 20),
            signLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            signLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: signLabel.bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            selectButton.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            selectButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            selectButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            selectButton.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        selectButton.addTarget(self, action: #selector(didSelectHoroscope), for: .touchUpInside)
        
    }
    
    func set(with horoscope: Horoscope) {
        signImageView.image = horoscope.image
        signLabel.text = horoscope.sign
        dateLabel.text = horoscope.dates.uppercased()
        
        
    }
    
    func setSelected() {
        selectButton.isHidden = false
    }
    
    func setDeselected() {
        selectButton.isHidden = false
    }
    
    @objc func didSelectHoroscope() {
        print("Yes")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        selectButton.applyGradient(colours: [
            UIColor(red: 1, green: 0.779, blue: 0.349, alpha: 1),
            UIColor(red: 0.969, green: 0.384, blue: 0.239, alpha: 1),
            UIColor(red: 0.742, green: 0.148, blue: 0, alpha: 1)
            
        ], locations: [0, 0.35, 1])
    }
    
    
}
