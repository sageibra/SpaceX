//
//  LaunchCell.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import UIKit

final class LaunchCell: UICollectionViewCell {

    private let missionName = UILabel()
    private let missionDate = UILabel()
    private let missionDateIcon = UIImageView()
    private let launchLocation = UILabel()
    private let launchLocationIcon = UIImageView()
    private let rocketName = UILabel()

    private let launchSuccessLabel = UILabel()
    private let launchSuccessIcon = UIImageView()
    private let missionPatch = UIImageView()

    private let launchLocationStack = UIStackView()
    private let missionDateStack = UIStackView()
    private let launchSuccessStack = UIStackView()
    private let leftInfoStack = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupDummyData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupDummyData() {
        missionName.text = "CREW-3"
        missionName.font = .systemFont(ofSize: 22, weight: .black)
        launchSuccessLabel.font = .systemFont(ofSize: 16, weight: .medium)
        missionDateIcon.image = Images.calendar
        missionDate.text = "October 31, 2021"
        launchLocation.text = "SLC-40"
        launchLocationIcon.image = Images.location
        launchSuccessLabel.text = "Success"
        launchSuccessIcon.image = Images.success
        missionPatch.backgroundColor = .systemBlue
        missionPatch.layer.cornerRadius = 45
        missionPatch.clipsToBounds = true
        rocketName.text = "  Falcon 9  "
        rocketName.backgroundColor = .systemGray5
        rocketName.layer.cornerRadius = 4
        rocketName.clipsToBounds = true

        launchSuccessIcon.tintColor = .systemGreen
        [missionDateIcon, launchLocationIcon].forEach {
            $0.tintColor = .label
        }
    }

    private func setupLayout() {

        missionDateStack.addArrangedSubviews(missionDateIcon, missionDate)
        launchLocationStack.addArrangedSubviews(launchLocationIcon, launchLocation)
        launchSuccessStack.addArrangedSubviews(launchSuccessLabel, launchSuccessIcon)

        [missionName, missionDateStack, launchLocationStack, rocketName, launchSuccessStack, missionPatch].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        [missionDateStack, launchLocationStack, launchSuccessStack].forEach {
            $0.alignment = .fill
            $0.spacing = 6
        }

        launchSuccessStack.alignment = .center
        leftInfoStack.addArrangedSubviews(missionDateStack, launchLocationStack)
        leftInfoStack.alignment = .leading
        leftInfoStack.axis = .vertical
        leftInfoStack.spacing = 6
        leftInfoStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(leftInfoStack)

        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 10
        clipsToBounds = true

        NSLayoutConstraint.activate([
            missionName.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            missionName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            leftInfoStack.topAnchor.constraint(equalTo: missionName.bottomAnchor, constant: 10),
            leftInfoStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),

            rocketName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            rocketName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),

            missionPatch.heightAnchor.constraint(equalToConstant: 90),
            missionPatch.widthAnchor.constraint(equalToConstant: 90),
            missionPatch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            missionPatch.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),

            launchSuccessStack.centerXAnchor.constraint(equalTo: missionPatch.centerXAnchor),
            launchSuccessStack.centerYAnchor.constraint(equalTo: missionName.centerYAnchor)
        ])
    }
}
