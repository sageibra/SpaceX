//
//  FavoritesViewController.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import UIKit

final class FavoritesViewController: UIViewController, FavoritesViewInput, ModuleTransitionable {

    private let tableView = UITableView()
    var output: FavoritesViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()

        output?.viewLoaded()
        setupTableView()
    }

    private func setupTableView() {
        tabBarController?.title = "Favorites"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self)

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource
extension FavoritesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(UITableViewCell.self, indexPath: indexPath)
        cell.textLabel?.text = "Ibragim"
        return cell
    }
}

// MARK: - UITableViewDelegate
extension FavoritesViewController: UITableViewDelegate {

}
