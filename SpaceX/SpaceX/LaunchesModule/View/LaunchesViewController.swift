//
//  LaunchesViewController.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 26/10/2021.
//

import UIKit

final class LaunchesViewController: UIViewController, ModuleTransitionable {

    private var collectionView: UICollectionView!
    var output: LaunchesViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewLoaded()
        setupCollectionView()
    }

    private func setupCollectionView() {
        tabBarController?.title = "Launches"
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createFlowLayout())
        collectionView.backgroundColor = .systemBackground
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
}

// MARK: - View Input
extension LaunchesViewController: LaunchesViewInput {
    func reload() {
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension LaunchesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        output.numberOfRows
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeue(LaunchCell.self, indexPath: indexPath)
        output.configure(cell: cell, forRow: indexPath.row)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension LaunchesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        output.didSelect(at: indexPath.item)
    }
}
