//
//  RocketsModuleConfigurator.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import UIKit

enum RocketsModuleConfigurator {

    static func configureModule() -> RocketsViewController {
        let view = RocketsViewController()
        view.tabBarItem = UITabBarItem(title: "Rockets", image: Images.rocketIcon, tag: 2)
        let presenter = RocketsModulePresenter()
        let router = RocketsModuleRouter()

        presenter.view = view
        view.output = presenter
        presenter.router = router
        router.view = view

        return view
    }
}
