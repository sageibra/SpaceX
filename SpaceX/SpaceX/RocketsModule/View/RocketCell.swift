//
//  RocketCell.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import UIKit

final class RocketCell: UITableViewCell {

    private let rocketName = UILabel()
    private let rocketType = UILabel()
    private let companyName = UILabel()
    private let rocketInfo = UILabel()
    private let rocketImage = UIImageView()
    private let textsInfoStack = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        setupLayout()
        setupDummyData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupDummyData() {
        rocketName.text = "Falcon 9"
        rocketType.text = "Super"
        companyName.text = "SpaceX"
        rocketInfo.text = """
Falcon 9 is a partially reusable two-stage-to-orbit medium-lift
launch vehicle designed and manufactured by SpaceX in the United States.
The latest version of the first stage can return
to Earth and be flown again multiple times.
"""
        rocketImage.backgroundColor = .systemPink
    }

    private func setupViews() {
        textsInfoStack.alignment = .leading
        textsInfoStack.distribution = .equalSpacing
        textsInfoStack.axis = .vertical
        textsInfoStack.spacing = 6
        rocketInfo.numberOfLines = 0
        rocketInfo.font = .systemFont(ofSize: 16, weight: .regular)
        rocketInfo.textColor = .secondaryLabel
        rocketName.font = .systemFont(ofSize: 24, weight: .black)
        rocketImage.layer.cornerRadius = 14
        rocketImage.clipsToBounds = true
    }

    private func setupLayout() {
        textsInfoStack.addArrangedSubviews(rocketName, rocketType, companyName, rocketInfo)
        [rocketImage, textsInfoStack].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        NSLayoutConstraint.activate([
            rocketImage.widthAnchor.constraint(equalToConstant: 120),
            rocketImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            rocketImage.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            rocketImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),

            textsInfoStack.leadingAnchor.constraint(equalTo: rocketImage.trailingAnchor, constant: 10),
            textsInfoStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            textsInfoStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            textsInfoStack.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        ])
    }
}
