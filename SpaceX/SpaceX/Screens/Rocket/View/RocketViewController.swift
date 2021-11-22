//
//  RocketViewController.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

final class RocketViewController: UIViewController, ModuleTransitionable {

    // MARK: - Outlets
    private let navBar = CustomNavBar()
    private let rocketImage = UIImageView()
    private let overview = SubTitleLabel(fontSize: 16)
    private let mass = PaddingLabel(fontSize: 16, backgroundColor: .systemGray5)
    private let height = PaddingLabel(fontSize: 16, backgroundColor: .systemGray5)
    private let firstFlight = PaddingLabel(fontSize: 16, backgroundColor: .systemGray5)
    private let status = PaddingLabel(fontSize: 16, backgroundColor: .systemGray5)
    private let successRate = PaddingLabel(fontSize: 16, backgroundColor: .systemGray5)
    private let wikipediaButton = UIButton()

    private let massLabel = UILabel()
    private let heightLabel = UILabel()
    private let firstFLabel = UILabel()
    private let statusLabel = UILabel()
    private let successRateLabel = UILabel()

    private let labelsStack = UIStackView()
    private let verticalStack = UIStackView()
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    var output: RocketViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    func setupViews() {
        view.backgroundColor = .systemBackground
        rocketImage.contentMode = .scaleAspectFit
        overview.numberOfLines = 0
        heightLabel.text = "Height:"
        massLabel.text = "Mass:"
        firstFLabel.text = "First flight:"
        statusLabel.text = "Status:"
        successRateLabel.text = "Success:"
        wikipediaButton.layer.cornerRadius = 8
        wikipediaButton.setTitle("Wikipedia", for: .normal)
        wikipediaButton.setTitleColor(.label, for: .normal)
        wikipediaButton.backgroundColor = .systemGray5
        wikipediaButton.addTarget(self, action: #selector(wikiButtonTapped), for: .touchUpInside)

        [heightLabel, massLabel, firstFLabel, statusLabel, successRateLabel].forEach { $0.textAlignment = .left }
        [height, mass, firstFlight, status, successRate].forEach { $0.textAlignment = .right }
        navBar.closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        [labelsStack, verticalStack].forEach {
            $0.axis = .vertical
            $0.spacing = 8
            $0.distribution = .fillEqually
        }
    }

    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.fillSuperview()
        scrollView.addSubview(contentView)
        contentView.fillSuperview()

        let contentViewCenterY = contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        [contentViewCenterY, contentViewHeight].forEach { $0.priority = .defaultLow }

        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentViewCenterY, contentViewHeight
        ])
    }

    func setupLayout() {
        [rocketImage, labelsStack, verticalStack, wikipediaButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        labelsStack.addArrangedSubviews(heightLabel, massLabel, firstFLabel, statusLabel, successRateLabel)
        verticalStack.addArrangedSubviews(height, mass, firstFlight, status, successRate)
        contentView.addSubviews(rocketImage, labelsStack, verticalStack, overview, wikipediaButton)
        let lastViewBottom = wikipediaButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        lastViewBottom.priority = .defaultLow
        view.addSubview(navBar)

        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 60),

            rocketImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            rocketImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 70),
            rocketImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25),
            rocketImage.heightAnchor.constraint(equalTo: rocketImage.widthAnchor, multiplier: 5),

            labelsStack.leadingAnchor.constraint(equalTo: rocketImage.trailingAnchor, constant: 10),
            labelsStack.centerYAnchor.constraint(equalTo: rocketImage.centerYAnchor),
            labelsStack.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor, constant: 10),
            labelsStack.heightAnchor.constraint(equalTo: verticalStack.heightAnchor),

            verticalStack.centerYAnchor.constraint(equalTo: rocketImage.centerYAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            overview.topAnchor.constraint(equalTo: rocketImage.bottomAnchor, constant: 10),
            overview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            overview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            overview.bottomAnchor.constraint(greaterThanOrEqualTo: wikipediaButton.topAnchor, constant: -10),

            wikipediaButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            wikipediaButton.topAnchor.constraint(equalTo: overview.bottomAnchor, constant: 10),
            wikipediaButton.heightAnchor.constraint(equalToConstant: 42),
            wikipediaButton.widthAnchor.constraint(equalToConstant: 160),
            lastViewBottom
        ])
    }
}

// MARK: - RocketViewInput
extension RocketViewController: RocketViewInput {
    func setupInitialState(with rocket: Rocket) {
        navBar.titleLabel.text = rocket.name
        rocketImage.image = rocket.image
        overview.text = rocket.overview
        height.text = rocket.height
        mass.text = rocket.mass
        firstFlight.text = rocket.firstFlight
        status.text = rocket.status
        successRate.text = rocket.successRatePct
    }
}

// MARK: - RocketViewOutput
extension RocketViewController {
    @objc func closeButtonTapped() {
        output?.dismissModule()
    }

    @objc func wikiButtonTapped() {
        output?.showSafariModule()
    }
}
