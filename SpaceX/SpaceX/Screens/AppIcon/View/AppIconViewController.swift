//
//  AppIconViewController.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 17/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

final class AppIconViewController: UIViewController, ModuleTransitionable {

    // MARK: - Outlets
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    var output: AppIconViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    func setupTableView() {
        title = "App Icon"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AppIconCell.self)
        tableView.rowHeight = 70

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

// MARK: - AppIconViewInput
extension AppIconViewController: AppIconViewInput {
    func reload() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension AppIconViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output?.numberOfRows ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(AppIconCell.self, indexPath: indexPath)
        output?.configure(cell: cell, with: indexPath.row)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension AppIconViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        output?.didSelect(at: indexPath.row)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == output?.currentIconIndex() { cell.accessoryType = .checkmark }
    }
}
