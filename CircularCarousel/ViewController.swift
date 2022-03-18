//
//  ViewController.swift
//  CircularCarousel
//
//  Created by Suha Baobaid on 3/18/22.
//

import UIKit

class ViewController: UIViewController {

    var horoscopeCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureCollectionView()
    }

    var horoscopes = [
        Images.aquarius,
        Images.aries,
        Images.capricorn,
        Images.cancer,
        Images.gemini,
        Images.leo,
        Images.libra,
        Images.pisces,
        Images.sagittarius,
        Images.scorpio,
        Images.taurus,
        Images.virgo
    ]
    
    private func configureCollectionView() {
        horoscopeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: LoopLayout())
        horoscopeCollectionView.delegate = self
        horoscopeCollectionView.dataSource = self
        horoscopeCollectionView.backgroundColor = .red
        horoscopeCollectionView.showsHorizontalScrollIndicator = false
        horoscopeCollectionView.register(SignCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        horoscopeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(horoscopeCollectionView)
        NSLayoutConstraint.activate([
            horoscopeCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            horoscopeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            horoscopeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            horoscopeCollectionView.heightAnchor.constraint(equalTo: horoscopeCollectionView.widthAnchor, constant: -68)
        ])
        
        horoscopeCollectionView.contentInset = UIEdgeInsets(top: 0, left: 34, bottom: 0, right: 34)
        
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return horoscopes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SignCollectionViewCell
        let correctIndex = indexPath.row >= horoscopes.count ? indexPath.row % horoscopes.count : indexPath.row
        
        cell.signImageView.image = horoscopes[correctIndex]
        return cell
    }
}
