//
//  LaunchDetailsViewController.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

final class LaunchDetailsViewController: UIViewController, ModuleTransitionable {

    // MARK: - Outlets
    private let launchName = TitleLabel(fontSize: 28)
    private let dateIcon = UIImageView(image: Images.calendar)
    private let dateLabel = UILabel()
    private let resultIcon = UIImageView()
    private let resultLabel = UILabel()
    private let imageCarouselView = ImageCarouselView()
    private let rocketButton = ImageButton(icon: Images.rocket)
    private let launchpadButton = ImageButton(icon: Images.locationCircle)
    private let launchDetails = UILabel()
    private lazy var webPageButton = ImageButton(icon: Images.network)
    private lazy var wikipediaButton = ImageButton(icon: Images.wikipedia)

    private let dateStack = UIStackView()
    private let resultStack = UIStackView()
    private let buttonsStack = UIStackView()
    private let horizontalStack = UIStackView()
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    var output: LaunchDetailsViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    func setupViews(with article: Bool, and wiki: Bool) {
        view.backgroundColor = .systemBackground
        webPageButton.isHidden = article
        wikipediaButton.isHidden = wiki

        imageCarouselView.layer.cornerRadius = 4
        imageCarouselView.clipsToBounds = true
        dateIcon.tintColor = .label

        [dateStack, resultStack].forEach { $0.spacing = 6 }

        resultStack.backgroundColor = .systemGray5
        resultStack.layer.cornerRadius = 4
        resultStack.alignment = .center
        resultStack.isLayoutMarginsRelativeArrangement = true
        resultStack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 12)

        buttonsStack.spacing = 10
        horizontalStack.distribution = .equalSpacing
        buttonsStack.distribution = .fillEqually

        resultLabel.font = .systemFont(ofSize: 18, weight: .medium)
        [launchName, launchDetails].forEach { $0.numberOfLines = 0 }

        [webPageButton, wikipediaButton, rocketButton, launchpadButton].forEach {
            $0.setPreferredSymbolConfiguration(.init(pointSize: 26), forImageIn: .normal)
            $0.layer.cornerRadius = 4
            $0.backgroundColor = .systemGray5
        }
    }

    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.fillSuperview()
        scrollView.addSubview(contentView)
        contentView.fillSuperview()

        let contentViewCenterY = contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        let lastViewBottom = launchDetails.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)

        [contentViewCenterY, contentViewHeight, lastViewBottom].forEach { $0.priority = .defaultLow }
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentViewCenterY, contentViewHeight, lastViewBottom
        ])
    }

    func setupLayout() {
        dateStack.addArrangedSubviews(dateIcon, dateLabel)
        resultStack.addArrangedSubviews(resultIcon, resultLabel)
        buttonsStack.addArrangedSubviews(rocketButton, launchpadButton, webPageButton, wikipediaButton)
        horizontalStack.addArrangedSubviews(resultStack, buttonsStack)

        [launchName, dateStack, horizontalStack, imageCarouselView, launchDetails].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        NSLayoutConstraint.activate([
            launchName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            launchName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            launchName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            dateStack.topAnchor.constraint(equalTo: launchName.bottomAnchor, constant: 4),
            dateStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            imageCarouselView.topAnchor.constraint(equalTo: dateStack.bottomAnchor, constant: 10),
            imageCarouselView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageCarouselView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            imageCarouselView.heightAnchor.constraint(equalTo: imageCarouselView.widthAnchor),

            rocketButton.widthAnchor.constraint(equalToConstant: 40),
            rocketButton.heightAnchor.constraint(equalToConstant: 40),

            horizontalStack.topAnchor.constraint(equalTo: imageCarouselView.bottomAnchor, constant: 10),
            horizontalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            horizontalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            launchDetails.topAnchor.constraint(equalTo: horizontalStack.bottomAnchor, constant: 10),
            launchDetails.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            launchDetails.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }

    func setupScrollView(with images: [UIImage]) {
        imageCarouselView.setupImages(images)
    }

    func setupActions() {
        webPageButton.addTarget(self, action: #selector(articleButtonTapped), for: .touchUpInside)
        wikipediaButton.addTarget(self, action: #selector(wikiButtonTapped), for: .touchUpInside)
        rocketButton.addTarget(self, action: #selector(rocketButtonTapped), for: .touchUpInside)
        launchpadButton.addTarget(self, action: #selector(launchpadButtonTapped), for: .touchUpInside)
    }
}

// MARK: - LaunchDetailsViewInput
extension LaunchDetailsViewController: LaunchDetailsViewInput {
    func setupInitialState(
        with launch: Launch, result: Bool, date: String,
        resultInfo: String, details: String
    ) {
        launchName.text = launch.name
        dateLabel.text = date
        launchDetails.text = details

        if launch.upcoming {
            resultLabel.text = "Upcoming"
            resultIcon.image = Images.clock
            resultIcon.tintColor = .systemBlue
        } else {
            resultLabel.text = resultInfo
            resultIcon.image = (result ? Images.success : Images.failure)
            resultIcon.tintColor = result ? .systemGreen : .systemRed
        }
    }
}

// MARK: - LaunchDetailsViewOutput
extension LaunchDetailsViewController {
    @objc private func articleButtonTapped() {
        output?.showArticle()
    }

    @objc private func wikiButtonTapped() {
        output?.showWikipedia()
    }

    @objc private func rocketButtonTapped() {
        output?.showRocketInfo()
    }

    @objc private func launchpadButtonTapped() {
        output?.showLaunchpadInfo()
    }
}
