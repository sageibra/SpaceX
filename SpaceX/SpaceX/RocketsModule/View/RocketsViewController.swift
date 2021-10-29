//
//  RocketsViewController.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import UIKit

final class RocketsViewController: UIViewController, ModuleTransitionable {

    private let tableView = UITableView()
    var output: RocketsViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()

        output?.viewLoaded()
        setupTableView()
    }

    private func setupTableView() {
        tabBarController?.title = "Rockets"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(RocketCell.self)
        tableView.rowHeight = 200
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

// MARK: - View Input
extension RocketsViewController: RocketsViewInput {
    func reload() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension RocketsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(RocketCell.self, indexPath: indexPath)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension RocketsViewController: UITableViewDelegate {}
