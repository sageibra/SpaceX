//
//  ThemePresenter.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 18/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

final class ThemePresenter {

    // MARK: - Properties
    weak var view: ThemeViewInput?
    var userDefaults: UserDefaults?
    var application: UIApplication?
}

// MARK: - ThemeModuleInput
extension ThemePresenter: ThemeModuleInput {
    func configure(with userDefaults: UserDefaults, and application: UIApplication) {
        self.userDefaults = userDefaults
        self.application = application
    }
}

// MARK: - ThemeViewOutput
extension ThemePresenter: ThemeViewOutput {
    var numberOfRows: Int { Theme.allCases.count }

    var theme: Theme {
        get { return userDefaults?.theme ?? Theme.automatic }
        set { userDefaults?.theme = newValue }
    }

    func viewLoaded() {
        view?.setupTableView()
    }

    func configure(cell: ThemeCellViewInput, with row: Int) {
        let theme = Theme.allCases[row]
        cell.configure(with: theme.title)
    }

    func didSelect(at row: Int) {
        if theme.rawValue != row {
            let chosenTheme = Theme.allCases[row]
            application?.windows.forEach { window in
                window.overrideUserInterfaceStyle = chosenTheme.userInterfaceStyle
            }

            theme = chosenTheme
            view?.reload()
        }
    }
}
