//
//  LaunchesViewController.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

final class LaunchesViewController: UIViewController, ModuleTransitionable {

    // MARK: - Outlets
    private var collectionView: UICollectionView!
    private let segmentedControl = UISegmentedControl(items: ["All", "Upcoming"])
    private lazy var activityIndicatorView = UIActivityIndicatorView(style: .large)
    private lazy var alertView = AlertView()
    var activityToggle: Bool = false {
        didSet { activityToggle ? activityIndicatorView.startAnimating() : activityIndicatorView.stopAnimating() }
    }

    var output: LaunchesViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.title = "Launches"
    }

    func setupActivityIndicator() {
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicatorView)

        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createFlowLayout())
        collectionView.backgroundColor = .systemGroupedBackground
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(LaunchCell.self)
    }

    private func createFlowLayout() -> UICollectionViewFlowLayout {
        let itemWidth = view.bounds.width - 40
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        flowLayout.itemSize = CGSize(width: itemWidth, height: 160)
        return flowLayout
    }

    func setupSegmentedControl() {
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        view.addSubview(segmentedControl)

        NSLayoutConstraint.activate([
            segmentedControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    func setupAlertView(with title: String, and message: String) {
        alertView.titleLabel.text = title
        alertView.messageLabel.text = message
        alertView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(alertView)
        alertView.fillSuperview()
    }
}

// MARK: - LaunchesViewInput
extension LaunchesViewController: LaunchesViewInput {
    func reload() {
        collectionView.reloadData()
    }
}

// MARK: - LaunchesViewOutput
extension LaunchesViewController {
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        output?.segmentSelected(at: sender.selectedSegmentIndex)
    }
}

// MARK: - UICollectionViewDataSource
extension LaunchesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        output?.numberOfRows ?? 0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeue(LaunchCell.self, indexPath: indexPath)
        output?.configure(cell: cell, forRow: indexPath.row)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension LaunchesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        output?.didSelect(at: indexPath.item)
    }
}
