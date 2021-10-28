//
//  LaunchesViewController.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 26/10/2021.
//

import UIKit

final class LaunchesViewController: UIViewController, LaunchesViewInput, ModuleTransitionable {

    private var collectionView: UICollectionView!
    var output: LaunchesViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()

        output?.viewLoaded()
        setupCollectionView()
    }

    private func setupCollectionView() {
        title = "Launches"
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createFlowLayout())
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.register(LaunchCell.self)
    }

    private func createFlowLayout() -> UICollectionViewFlowLayout {
        let itemWidth = view.bounds.width - 40
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        flowLayout.itemSize = CGSize(width: itemWidth, height: 160)
        return flowLayout
    }
}

// MARK: - UICollectionViewDataSource
extension LaunchesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(LaunchCell.self, indexPath: indexPath)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension LaunchesViewController: UICollectionViewDelegate {}
