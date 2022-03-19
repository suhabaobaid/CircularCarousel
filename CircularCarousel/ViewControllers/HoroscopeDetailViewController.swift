//
//  HoroscopeDetailViewController.swift
//  CircularCarousel
//
//  Created by Suha Baobaid on 3/19/22.
//

import UIKit

class HoroscopeDetailViewController: UIViewController {
    
    
    // MARK: - UI
    var coverImageView: UIImageView = {
        var imageview = UIImageView(image: Images.virgoHeader)
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    var greetingLabel = TitleLabel(headingText: "Hello!", textColor: UIColor(red: 0.263, green: 0.267, blue: 0.369, alpha: 1), textAlignment: .left)
    var bodyLabel = BodyLabel(headingText: Strings.dummyHoroscopeText, textColor: UIColor(red: 0.263, green: 0.267, blue: 0.369, alpha: 1), textAlignment: .left)
    var todayLabel: SubTitleLabel = {
        var label = SubTitleLabel(headingText: "TODAY", textColor: UIColor(red: 0.263, green: 0.267, blue: 0.369, alpha: 1))
        return label
    }()
    var dateLabel: SubTitleLabel = {
        var todayDate = Date.now
        var dateLabel = SubTitleLabel(headingText: todayDate.formatted(date: .abbreviated, time: .omitted).uppercased(), textColor: .lightGray)
        dateLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        return dateLabel
    }()
    
    // MARK: - Data
    var horoscope: Horoscope
    
    init(for horoscope: Horoscope) {
        self.horoscope = horoscope
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    func setupViews(){
        let horizontalPadding: CGFloat = 20
        
        view.addSubview(coverImageView)
        view.addSubview(todayLabel)
        view.addSubview(dateLabel)
        view.addSubview(greetingLabel)
        view.addSubview(bodyLabel)
        
        NSLayoutConstraint.activate([
            coverImageView.topAnchor.constraint(equalTo: view.topAnchor),
            coverImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coverImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coverImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            todayLabel.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: 15),
            todayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalPadding),
            
            dateLabel.centerYAnchor.constraint(equalTo: todayLabel.centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: todayLabel.trailingAnchor, constant: 5),
            
            
            greetingLabel.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 15),
            greetingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalPadding),
            greetingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalPadding),
            
            bodyLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 15),
            bodyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalPadding),
            bodyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalPadding)
        ])
        
    }
}
