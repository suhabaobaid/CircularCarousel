//
//  ViewController.swift
//  CircularCarousel
//
//  Created by Suha Baobaid on 3/18/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UI
    var horoscopeCollectionView: UICollectionView!
    var headlineLabel: HeadlineLabel = {
        var label = HeadlineLabel(headingText: "Choose your zodiac sign.\nWhat do your stars say today?", textColor: .white, textAlignment: .left)
        label.numberOfLines = 0
        return label
    }()
    var backgroundView: UIImageView = {
        var imageview = UIImageView(image: Images.background)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    // MARK: - Data
    var signs: [Horoscope] = [
        Horoscope(id: 0, image: Images.aries, sign: "Aries", dates: "March 21 - April 19"),
        Horoscope(id: 1, image: Images.taurus, sign: "Taurus", dates: "April 20 - May 20"),
        Horoscope(id: 2, image: Images.gemini, sign: "Gemini", dates: "May 21 - June 20"),
        Horoscope(id: 3, image: Images.cancer, sign: "Cancer", dates: "June 21 - July 22"),
        Horoscope(id: 4, image: Images.leo, sign: "Leo", dates: "March 21 - April 19"),
        Horoscope(id: 5, image: Images.virgo, sign: "Virgo", dates: "August 23 - September 22"),
        Horoscope(id: 6, image: Images.libra, sign: "Libra", dates: "September 23 - October 22"),
        Horoscope(id: 7, image: Images.scorpio, sign: "Scorpio", dates: "October 23 - November 21"),
        Horoscope(id: 8, image: Images.sagittarius, sign: "Sagittarius", dates: "November 22 - December 21"),
        Horoscope(id: 9, image: Images.capricorn, sign: "Capricorn", dates: "December 22 - January 19"),
        Horoscope(id: 10, image: Images.aquarius, sign: "Aquarius", dates: "January 20 - February 18"),
        Horoscope(id: 11, image: Images.pisces, sign: "Pisces", dates: "February 19 - March 20"),
    ]
    var currentlySelectedHoroscopeIndexPath: IndexPath?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackground()
        configureHeadline()
        configureCollectionView()
    }
    
    // MARK: - Configure
    private func configureBackground() {
        view.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureHeadline() {
        view.addSubview(headlineLabel)
        let topPadding: CGFloat = view.bounds.size.height / 7
        
        NSLayoutConstraint.activate([
            headlineLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topPadding),
            headlineLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            headlineLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            headlineLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func configureCollectionView() {
        horoscopeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: CircularLayout())
        horoscopeCollectionView.delegate = self
        horoscopeCollectionView.dataSource = self
        horoscopeCollectionView.backgroundColor = .clear
        horoscopeCollectionView.showsHorizontalScrollIndicator = false
        horoscopeCollectionView.register(SignCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        horoscopeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(horoscopeCollectionView)
        NSLayoutConstraint.activate([
            horoscopeCollectionView.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: 30),
            horoscopeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            horoscopeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            horoscopeCollectionView.heightAnchor.constraint(equalTo: horoscopeCollectionView.widthAnchor, constant: 0)
        ])
        
    }
}

// MARK: - CollectionViewDelegates & DataSource
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return signs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SignCollectionViewCell
        cell.set(with: signs[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! SignCollectionViewCell
        currentlySelectedHoroscopeIndexPath = indexPath
        selectedCell.isHoroscopeSelected = !selectedCell.isHoroscopeSelected
    }
    
    
}

// MARK: - ScrollView
extension ViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // unselect if scrolled
        guard let currentlySelectedHoroscopeIndexPath = currentlySelectedHoroscopeIndexPath else { return }
        let deselectCell = horoscopeCollectionView.cellForItem(at: currentlySelectedHoroscopeIndexPath) as! SignCollectionViewCell
        deselectCell.isHoroscopeSelected = false
        self.currentlySelectedHoroscopeIndexPath = nil
    }

}

extension ViewController: SignCollectionViewCellDelegate {
    func didSelectHoroscope(_ horoscope: Horoscope) {
        print(horoscope)
    }
    
}
