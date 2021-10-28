//
//  LaunchesModuleConfigurator.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import UIKit

enum LaunchesModuleConfigurator {

    static func configureModule() -> LaunchesViewController {
        let view = LaunchesViewController()
        view.tabBarItem = UITabBarItem(title: "Launches", image: Images.launchesIcon, tag: 1)
        let presenter = LaunchesModulePresenter()
        let router = LaunchesModuleRouter()

        presenter.view = view
        view.output = presenter
        presenter.router = router
        router.view = view

        return view
    }
}
