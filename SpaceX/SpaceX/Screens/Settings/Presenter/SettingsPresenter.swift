//
//  SettingsPresenter.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

final class SettingsPresenter {

    // MARK: - Properties
    private let twitter = URL(staticString: "https://twitter.com/sageibra_")
    private let github = URL(staticString: "https://github.com/sageibra")
    private let apiRepository = URL(staticString: "https://github.com/r-spacex/SpaceX-API")

    weak var view: SettingsViewInput?
    var router: SettingsRouterInput?
}

// MARK: - SettingsViewOutput
extension SettingsPresenter: SettingsViewOutput {
    var numberOfSections: Int { Section.allCases.count }

    func viewLoaded() { view?.setupTableView() }

    func numberOfRows(for section: Int) -> Int {
        guard let section = Section(rawValue: section) else { return 0 }
        return section.rows.count
    }
}

// MARK: - SettingsCellViewInput
extension SettingsPresenter {
    func configure(cell: SettingsCellViewInput, with section: Int, and row: Int) {
        guard let section = Section(rawValue: section) else { return }
        let row = section.rows[row]
        cell.configure(with: row.text, icon: row.icon)
    }
}

// MARK: - SettingsPresenterOutput
extension SettingsPresenter {
    func didSelect(at section: Int, and row: Int) {
        guard let section = Section(rawValue: section) else { return }
        switch section {
        case .main:
            let main = MainSectionRows.allCases[row]
            switch main {
            case .theme: router?.presentThemeModule()
            case .appIcon: router?.presentAppIconModule()
            }

        case .links:
            let links = LinksSectionRows.allCases[row]
            switch links {
            case .followMeOnTwitter: router?.presentSafariModule(with: twitter)
            case .followMeOnGithub: router?.presentSafariModule(with: github)
            case .spaceXApi: router?.presentSafariModule(with: apiRepository)
            }
        }
    }
}
