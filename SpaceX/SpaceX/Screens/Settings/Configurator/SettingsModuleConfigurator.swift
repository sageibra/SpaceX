//
//  SettingsModuleConfigurator.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

final class SettingsModuleConfigurator {

    // MARK: - Internal methods
    func configure(with diContainer: DependencyContainer) -> SettingsViewController {
        let view = SettingsViewController()
        let presenter = SettingsPresenter()
        presenter.configure(with: diContainer)
        let router = SettingsRouter()

        presenter.view = view
        presenter.router = router
        router.view = view
        view.output = presenter

        return view
    }
}
