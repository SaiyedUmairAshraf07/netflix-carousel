//
//  HomeBarView.swift
//  NetflixCarousel
//
//  Created by Saiyed_Cedcoss on 28/06/26.
//

import UIKit

class HomeBarView: UIView {

    private let logoImageView  = UIImageView()
    private let titleLabel     = UILabel()
    private let castButton     = UIButton(type: .system)
    private let downloadButton = UIButton(type: .system)
    private let bellButton     = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        backgroundColor = UIColor(red: 0.078, green: 0.078, blue: 0.078, alpha: 1)

        logoImageView.image = UIImage(named: "N")
        logoImageView.contentMode = .scaleToFill
        logoImageView.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.text = "Home"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        configure(castButton,     systemName: "airplayvideo")
        configure(downloadButton, systemName: "arrow.down.to.line")
        configure(bellButton,     systemName: "bell")

        let leftStack = UIStackView(arrangedSubviews: [logoImageView, titleLabel])
        leftStack.axis = .horizontal
        leftStack.spacing = 8
        leftStack.alignment = .center
        leftStack.translatesAutoresizingMaskIntoConstraints = false

        let rightStack = UIStackView(arrangedSubviews: [castButton, downloadButton, bellButton])
        rightStack.axis = .horizontal
        rightStack.spacing = 18
        rightStack.alignment = .center
        rightStack.translatesAutoresizingMaskIntoConstraints = false

        addSubview(leftStack)
        addSubview(rightStack)

        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: 35),
            logoImageView.heightAnchor.constraint(equalToConstant: 35),

            leftStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            leftStack.centerYAnchor.constraint(equalTo: centerYAnchor),

            rightStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            rightStack.centerYAnchor.constraint(equalTo: centerYAnchor),

            castButton.widthAnchor.constraint(equalToConstant: 22),
            castButton.heightAnchor.constraint(equalToConstant: 22),
            downloadButton.widthAnchor.constraint(equalToConstant: 22),
            downloadButton.heightAnchor.constraint(equalToConstant: 22),
            bellButton.widthAnchor.constraint(equalToConstant: 22),
            bellButton.heightAnchor.constraint(equalToConstant: 22),
        ])
    }

    private func configure(_ button: UIButton, systemName: String) {
        button.setImage(UIImage(systemName: systemName), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
    }
}
