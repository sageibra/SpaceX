//
//  SettingsViewController.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController, ModuleTransitionable {

    // MARK: - Outlets
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    var output: SettingsViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.title = "Settings"
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SettingsCell.self)

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

// MARK: - SettingsViewInput
extension SettingsViewController: SettingsViewInput {
    func reload() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output?.numberOfRows(for: section) ?? 0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return output?.numberOfSections ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(SettingsCell.self, indexPath: indexPath)
        output?.configure(cell: cell, with: indexPath.section, and: indexPath.row)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        output?.didSelect(at: indexPath.section, and: indexPath.row)
    }
}
