//
//  HoroscopeDetailViewController.swift
//  CircularCarousel
//
//  Created by Suha Baobaid on 3/19/22.
//

import UIKit

class HoroscopeDetailViewController: UIViewController {
    
    
    // MARK: - UI
    let scrollView = UIScrollView()
    let contentView = UIView()
    var coverImageView: UIImageView = {
        var imageview = UIImageView(image: Images.virgoHeader)
        imageview.contentMode = .scaleAspectFill
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
        setupScrollView()
        setupViews()
    }
    
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
    }
    
    func setupViews(){
        let horizontalPadding: CGFloat = 20
        
        contentView.addSubview(coverImageView)
        contentView.addSubview(todayLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(greetingLabel)
        contentView.addSubview(bodyLabel)
        
        NSLayoutConstraint.activate([
            coverImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            coverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            coverImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            coverImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            todayLabel.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: 30),
            todayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalPadding),
            
            dateLabel.centerYAnchor.constraint(equalTo: todayLabel.centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: todayLabel.trailingAnchor, constant: 5),
            
            
            greetingLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 15),
            greetingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalPadding),
            greetingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalPadding),
            
            bodyLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 10),
            bodyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalPadding),
            bodyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalPadding),
            bodyLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
}
