//
//  ThemeViewController.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 18/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

final class ThemeViewController: UIViewController, ModuleTransitionable {

    // MARK: - Outlets
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    var output: ThemeViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    func setupTableView() {
        title = "Theme"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ThemeCell.self)

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

// MARK: - ThemeViewInput
extension ThemeViewController: ThemeViewInput {
    func reload() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension ThemeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output?.numberOfRows ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(ThemeCell.self, indexPath: indexPath)
        output?.configure(cell: cell, with: indexPath.row)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ThemeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        output?.didSelect(at: indexPath.row)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == output?.theme.rawValue { cell.accessoryType = .checkmark }
    }
}
