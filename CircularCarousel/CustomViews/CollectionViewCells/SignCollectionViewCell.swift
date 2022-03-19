//
//  SignCollectionViewCell.swift
//  CarouselSmores
//
//  Created by Suha Baobaid on 3/18/22.
//

import UIKit

protocol SignCollectionViewCellDelegate: AnyObject {
    func didSelectHoroscope(_ horoscope: Horoscope)
}

class SignCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI
    lazy var selectedView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
    var horoscopeItem: Horoscope?
    weak var delegate: SignCollectionViewCellDelegate?
    
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
        selectedView.isHidden = true
    }
    
    private func configure() {
        backgroundColor = .clear
        contentView.clipsToBounds = false
        
        contentView.addSubview(selectedView)
        contentView.addSubview(signImageView)
        contentView.addSubview(signLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(selectButton)
     
        
        NSLayoutConstraint.activate([
            selectedView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -15),
            selectedView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            selectedView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            selectedView.heightAnchor.constraint(equalTo: selectedView.widthAnchor),
            
            signImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            signImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            signImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            signImageView.heightAnchor.constraint(equalTo: signImageView.widthAnchor),
            
            signLabel.topAnchor.constraint(equalTo: signImageView.bottomAnchor, constant: 10),
            signLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            signLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: signLabel.bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            selectButton.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            selectButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            selectButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            selectButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        selectButton.addTarget(self, action: #selector(didSelectHoroscope), for: .touchUpInside)
        
    }
    
    func set(with horoscope: Horoscope) {
        self.horoscopeItem = horoscope
        
        signImageView.image = horoscope.image
        signLabel.text = horoscope.sign
        dateLabel.text = horoscope.dates.uppercased()
    }
    
    func setSelected() {
        animateTransitions(with: false)
    }
    
    func setDeselected() {
        animateTransitions(with: true)
    }
    
    func animateTransitions(with newValue: Bool) {
        UIView.transition(with: self, duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: {
            self.selectButton.isHidden = newValue
            self.selectedView.isHidden = newValue
        })
    }
    
    @objc func didSelectHoroscope() {
        guard let horoscopeItem = horoscopeItem else {
            return
        }
        delegate?.didSelectHoroscope(horoscopeItem)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        selectButton.applyGradient(colours: [
            UIColor(red: 1, green: 0.779, blue: 0.349, alpha: 1),
            UIColor(red: 0.969, green: 0.384, blue: 0.239, alpha: 1),
            UIColor(red: 0.742, green: 0.148, blue: 0, alpha: 1)
            
        ], locations: [0, 0.35, 1])
        
        selectedView.layer.cornerRadius = selectedView.bounds.size.width / 2
    }
    
    
}
