//
//  HomeViewController.swift
//  NetflixCarousel
//
//  Created by Saiyed_Cedcoss on 28/06/26.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {

    private let homeBarView    = HomeBarView()
    private let collectionView = HomeCarouselCV()
    private let movies = (1...10).map { "img\($0)" }
    
    private var currentIndex = 0
    private var autoScrollTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        setupHomeBarView()
        setupCollectionView()
    }

    func setupscrollView() {
        autoScrollTimer?.invalidate()
        autoScrollTimer = Timer.scheduledTimer(withTimeInterval: 4.0, repeats: true, block: { [weak self] _ in
        })
    }
    
    
    private func setupHomeBarView() {
        homeBarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(homeBarView)
        NSLayoutConstraint.activate([
            homeBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeBarView.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }

    private func setupCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: homeBarView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 560)
        ])
    }
}

extension HomeViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCarouselCVCell.reuseID, for: indexPath) as! HomeCarouselCVCell
        cell.configure(imageName: movies[indexPath.item])
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDelegate, UIScrollViewDelegate {
    
//Cell Height
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 460)
    }
    
    //SCroll
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
    }

}
