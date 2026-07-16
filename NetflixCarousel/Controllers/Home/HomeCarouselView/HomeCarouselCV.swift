//
//  HomeCarouselCV.swift
//  NetflixCarousel
//
//  Created by Saiyed_Cedcoss on 28/06/26.
//

import UIKit

class HomeCarouselCV: UICollectionView {

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: 140, height: 200)
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        super.init(frame: .zero, collectionViewLayout: layout)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        backgroundColor = .clear
        showsHorizontalScrollIndicator = false
        register(
            UINib(nibName: "HomeCarouselCVCell", bundle: nil),
            forCellWithReuseIdentifier: HomeCarouselCVCell.reuseID
        )
    }
}

