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
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        missionName.font = .systemFont(ofSize: 22, weight: .black)
        missionName.numberOfLines = 2
        launchSuccessLabel.font = .systemFont(ofSize: 16, weight: .medium)
        missionDateIcon.image = Images.calendar
        launchLocationIcon.image = Images.location

        missionPatch.backgroundColor = .systemBlue
        missionPatch.layer.cornerRadius = 45
        missionPatch.clipsToBounds = true

        rocketName.backgroundColor = .systemGray5
        rocketName.layer.cornerRadius = 4
        rocketName.clipsToBounds = true

        [missionDateIcon, launchLocationIcon].forEach { $0.tintColor = .label }

        leftInfoStack.alignment = .leading
        leftInfoStack.axis = .vertical

        [missionDateStack, launchLocationStack, launchSuccessStack, leftInfoStack].forEach {
            $0.spacing = 6
        }
    }

    private func setupLayout() {
        missionDateStack.addArrangedSubviews(missionDateIcon, missionDate)
        launchLocationStack.addArrangedSubviews(launchLocationIcon, launchLocation)
        leftInfoStack.addArrangedSubviews(missionDateStack, launchLocationStack)
        launchSuccessStack.addArrangedSubviews(launchSuccessLabel, launchSuccessIcon)

        [missionName, leftInfoStack, rocketName, launchSuccessStack, missionPatch].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 10
        clipsToBounds = true

        NSLayoutConstraint.activate([
            missionName.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            missionName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            missionName.trailingAnchor.constraint(equalTo: missionPatch.leadingAnchor, constant: -10),

            leftInfoStack.topAnchor.constraint(equalTo: missionName.bottomAnchor, constant: 10),
            leftInfoStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            leftInfoStack.trailingAnchor.constraint(equalTo: missionPatch.leadingAnchor, constant: -14),

            rocketName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            rocketName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),

            missionPatch.heightAnchor.constraint(equalToConstant: 90),
            missionPatch.widthAnchor.constraint(equalToConstant: 90),
            missionPatch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            missionPatch.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),

            launchSuccessStack.centerXAnchor.constraint(equalTo: missionPatch.centerXAnchor),
            launchSuccessStack.topAnchor.constraint(equalTo: topAnchor, constant: 16)
        ])
    }
}

// MARK: - View Input
extension LaunchCell: LaunchCellViewInput {

    func configure(mission: String, date: String, location: String, rName: String, launchResult: Bool) {
        missionName.text = mission
        missionDate.text = date
        launchLocation.text = location
        rocketName.text = rName.addWhiteSpaces()
        launchSuccessIcon.tintColor = launchResult ? .systemGreen : .systemRed
        launchSuccessLabel.text = launchResult ? "Success" : "Failed"
        launchSuccessIcon.image = launchResult ? Images.success : Images.failure
    }
}
