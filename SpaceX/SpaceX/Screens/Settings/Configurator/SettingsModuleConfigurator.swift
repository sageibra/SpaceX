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
    func configure() -> SettingsViewController {
        let view = SettingsViewController()
        view.tabBarItem = UITabBarItem(title: "Settings", image: Images.settingsIcon, tag: 1)
        let presenter = SettingsPresenter()
        let router = SettingsRouter()

        presenter.view = view
        presenter.router = router
        router.view = view
        view.output = presenter

        return view
    }
}
