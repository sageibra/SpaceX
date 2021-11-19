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
    func configure() -> ThemeViewController {
        let view = ThemeViewController()
        let presenter = ThemePresenter()
        presenter.configure(with: UserDefaults.standard, and: UIApplication.shared)
        presenter.view = view
        view.output = presenter

        return view
    }

}
