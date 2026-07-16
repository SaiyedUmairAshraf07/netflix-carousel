//
//  HomeCarouselCVCell.swift
//  NetflixCarousel
//
//  Created by Saiyed_Cedcoss on 28/06/26.
//

import UIKit

class HomeCarouselCVCell: UICollectionViewCell {

    static let reuseID = "HomeCarouselCVCell"

    @IBOutlet weak var container_vW: UIView!
    @IBOutlet weak var img_vW: UIImageView!
    
    private let gradientLayer = CAGradientLayer()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    func configure(imageName: String) {
        img_vW.image = UIImage(named: imageName)
    }

    private func setupView() {
        img_vW.contentMode = .scaleAspectFill
        img_vW.layer.cornerRadius = 10
        img_vW.clipsToBounds = true
        container_vW.layer.cornerRadius = 10
        container_vW.layer.masksToBounds = true

        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.85).cgColor]
        gradientLayer.locations = [0.4, 1.0]
        img_vW.layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
          super.layoutSubviews()
          gradientLayer.frame = img_vW.bounds   // CAGradientLayer needs manual frame updates — it's not Auto Layout aware
      }

}
