//
//  LaunchpadViewController.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit
import MapKit

final class LaunchpadViewController: UIViewController, ModuleTransitionable {

    // MARK: - Outlets
    private let navBar = CustomNavBar()
    private let name = TitleLabel(fontSize: 18, fontWeight: .medium)
    private let region = SubTitleLabel(fontSize: 16)
    private let status = PaddingLabel(fontSize: 16)
    private let attemptsCount = PaddingLabel(fontSize: 18)
    private let attempts = SubTitleLabel(fontSize: 17)
    private let successesCount = PaddingLabel(fontSize: 18)
    private let success = SubTitleLabel(fontSize: 17)
    private let successRateCount = PaddingLabel(fontSize: 18)
    private let successRate = SubTitleLabel(fontSize: 17)
    private let details = UILabel()
    private var mapView = MKMapView()
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private let nameAndRegionStack = UIStackView()
    private let attemptsStack = UIStackView()
    private let successStack = UIStackView()
    private let successRateStack = UIStackView()
    private let horizontalStack = UIStackView()

    var output: LaunchpadViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    func setupViews() {
        view.backgroundColor = .systemBackground
        navBar.closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        attempts.text = "attempted launches"
        success.text = "successful launches"
        successRate.text = "success rate"

        details.numberOfLines = 0
        horizontalStack.distribution = .fillEqually
        nameAndRegionStack.axis = .vertical
        horizontalStack.spacing = 12
        mapView.layer.cornerRadius = 6

        [attemptsCount, successesCount, successRateCount].forEach { $0.textAlignment = .center }
        [attempts, success, successRate].forEach {
            $0.numberOfLines = 2
            $0.textAlignment = .center
        }

        [attemptsStack, successStack, successRateStack].forEach {
            $0.spacing = 4
            $0.axis = .vertical
            $0.alignment = .center
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
        nameAndRegionStack.addArrangedSubviews(name, region)
        attemptsStack.addArrangedSubviews(attemptsCount, attempts)
        successStack.addArrangedSubviews(successesCount, success)
        successRateStack.addArrangedSubviews(successRateCount, successRate)
        horizontalStack.addArrangedSubviews(attemptsStack, successStack, successRateStack)
        let lastViewBottom = details.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        lastViewBottom.priority = .defaultLow

        [mapView, nameAndRegionStack, status, horizontalStack, details].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        view.addSubview(navBar)

        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 60),

            mapView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 70),
            mapView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mapView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            mapView.heightAnchor.constraint(equalTo: mapView.widthAnchor),

            nameAndRegionStack.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 20),
            nameAndRegionStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameAndRegionStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            status.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            status.centerYAnchor.constraint(equalTo: nameAndRegionStack.centerYAnchor),

            horizontalStack.topAnchor.constraint(equalTo: nameAndRegionStack.bottomAnchor, constant: 20),
            horizontalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            horizontalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),

            details.topAnchor.constraint(equalTo: horizontalStack.bottomAnchor, constant: 20),
            details.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            details.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            attemptsCount.widthAnchor.constraint(equalToConstant: 80),
            successesCount.widthAnchor.constraint(equalToConstant: 80),
            successRateCount.widthAnchor.constraint(equalToConstant: 80),
            lastViewBottom
        ])
    }
}

// MARK: - LaunchpadViewInput
extension LaunchpadViewController: LaunchpadViewInput {
    func setupInitialState(
        launchpad: Launchpad, attempts: String, successes: String,
        location: CLLocation, annotation: MKPointAnnotation
    ) {
        name.text = launchpad.name
        navBar.titleLabel.text = launchpad.locality
        region.text = launchpad.region
        status.text = launchpad.status
        successRateCount.text = launchpad.successRate
        attemptsCount.text = attempts
        successesCount.text = successes
        details.text = launchpad.details
        mapView.centerToLocation(location)
        mapView.addAnnotation(annotation)
    }
}

// MARK: - LaunchpadViewOutput
extension LaunchpadViewController {
    @objc func closeButtonTapped() {
        output?.dismissModule()
    }
}
