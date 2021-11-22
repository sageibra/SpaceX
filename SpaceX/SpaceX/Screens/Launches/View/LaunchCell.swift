//
//  LaunchCell.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import UIKit

final class LaunchCell: UICollectionViewCell {

    // MARK: - Outlets
    private let missionName = TitleLabel(fontSize: 22)
    private let missionDate = UILabel()
    private let missionDateIcon = UIImageView()
    private let launchLocation = UILabel()
    private let launchLocationIcon = UIImageView()
    private let rocketName = PaddingLabel(fontSize: 16, backgroundColor: .quaternarySystemFill)

    private let launchSuccessLabel = UILabel()
    private let launchSuccessIcon = UIImageView()
    private let missionPatch = UIImageView()

    private let launchLocationStack = UIStackView()
    private let missionDateStack = UIStackView()
    private let launchSuccessStack = UIStackView()
    private let leftInfoStack = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        missionPatch.image = nil
    }

    func setupViews() {
        backgroundColor = .secondarySystemGroupedBackground
        layer.cornerRadius = 10
        clipsToBounds = true

        missionName.numberOfLines = 2
        launchSuccessLabel.font = .systemFont(ofSize: 16, weight: .medium)
        missionDateIcon.image = Images.calendar
        launchLocationIcon.image = Images.location

        [missionDateIcon, launchLocationIcon].forEach { $0.tintColor = .label }

        leftInfoStack.alignment = .leading
        leftInfoStack.axis = .vertical

        [missionDateStack, launchLocationStack, launchSuccessStack, leftInfoStack].forEach {
            $0.spacing = 4
        }
    }

    func setupLayout() {
        missionDateStack.addArrangedSubviews(missionDateIcon, missionDate)
        launchLocationStack.addArrangedSubviews(launchLocationIcon, launchLocation)
        leftInfoStack.addArrangedSubviews(missionDateStack, launchLocationStack)
        launchSuccessStack.addArrangedSubviews(launchSuccessLabel, launchSuccessIcon)

        [missionName, leftInfoStack, rocketName, launchSuccessStack, missionPatch].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        NSLayoutConstraint.activate([
            missionName.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            missionName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            missionName.trailingAnchor.constraint(equalTo: missionPatch.leadingAnchor, constant: -20),

            leftInfoStack.topAnchor.constraint(equalTo: missionName.bottomAnchor, constant: 6),
            leftInfoStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            leftInfoStack.trailingAnchor.constraint(equalTo: missionPatch.leadingAnchor, constant: -14),

            rocketName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            rocketName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),

            missionPatch.heightAnchor.constraint(equalToConstant: 90),
            missionPatch.widthAnchor.constraint(equalToConstant: 90),
            missionPatch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            missionPatch.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),

            launchSuccessStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            launchSuccessStack.topAnchor.constraint(equalTo: topAnchor, constant: 16)
        ])
    }
}

// MARK: - LaunchCellViewInput
extension LaunchCell: LaunchCellViewInput {
    func configure(with launch: Launch, date: String, location: String, rocket: String, launchResult: Bool) {
        missionName.text = launch.name
        missionDate.text = date
        launchLocation.text = location
        rocketName.text = rocket

        if launch.upcoming {
            launchSuccessIcon.tintColor = .systemBlue
            launchSuccessLabel.text = "Upcoming"
            launchSuccessIcon.image = Images.clock
        } else {
            launchSuccessIcon.tintColor = launchResult ? .systemGreen : .systemRed
            launchSuccessLabel.text = launchResult ? "Success" : "Failed"
            launchSuccessIcon.image = launchResult ? Images.success : Images.failure
        }
    }

    func configure(with image: UIImage) {
        missionPatch.image = image
    }
}
