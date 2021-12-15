//
//  ThemeModuleConfigurator.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 18/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

final class ThemeModuleConfigurator {

    // MARK: - Internal methods
    func configure(with userDefaults: UserDefaults, and application: UIApplication) -> ThemeViewController {
        let view = ThemeViewController()
        let presenter = ThemePresenter()
        presenter.configure(with: userDefaults, and: application)
        presenter.view = view
        view.output = presenter

        return view
    }
}
