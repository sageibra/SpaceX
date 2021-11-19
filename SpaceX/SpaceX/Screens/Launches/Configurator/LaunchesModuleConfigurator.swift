//
//  LaunchesModuleConfigurator.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

final class LaunchesModuleConfigurator {

    // MARK: - Internal methods
    func configure(service: LaunchesNetworkServiceProtocol, endpoint: Endpoint) -> LaunchesViewController {
        let view = LaunchesViewController()
        view.tabBarItem = UITabBarItem(title: "Launches", image: Images.launchesIcon, tag: 0)
        let presenter = LaunchesPresenter()
        presenter.configure(with: service, and: endpoint)
        let router = LaunchesRouter()

        presenter.view = view
        presenter.router = router
        router.view = view
        view.output = presenter

        return view
    }

}
