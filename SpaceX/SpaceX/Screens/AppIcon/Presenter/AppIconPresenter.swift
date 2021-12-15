//
//  AppIconPresenter.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 17/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

final class AppIconPresenter {

    // MARK: - Properties
    weak var view: AppIconViewInput?
    var application: UIApplication?
}

// MARK: - AppIconModuleInput
extension AppIconPresenter: AppIconModuleInput {
    func configure(with application: UIApplication) {
        self.application = application
    }
}

// MARK: - AppIconViewOutput
extension AppIconPresenter: AppIconViewOutput {
    func viewLoaded() {
        view?.setupTableView()
    }

    var numberOfRows: Int {
        AppIcon.allCases.count
    }

    func configure(cell: AppIconCellViewInput, with row: Int) {
        let appIcon = AppIcon.allCases[row]
        cell.configure(with: appIcon.text, icon: appIcon.icon)
    }

    func didSelect(at row: Int) {
        if row != currentIconIndex() {
            let appIcon = AppIcon.allCases[row]
            application?.setAlternateIconName(appIcon.name)
            view?.reload()
        }
    }

    func currentIconIndex() -> Int {
        if let iconName = application?.alternateIconName {
            guard let icon = AppIcon.allCases.first(where: { $0.name == iconName }) else { return 0 }
            return icon.rawValue
        }

        return 0
    }
}
