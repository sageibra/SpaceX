//
//  LaunchDetailsModuleConfigurator.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 29/10/2021.
//

import UIKit

enum LaunchDetailsModuleConfigurator {

    static func configureModule(_ launchInfo: Launch) -> LaunchDetailsViewController {
        let view = LaunchDetailsViewController()
        let presenter = LaunchDetailsModulePresenter(launchInfo: launchInfo)
        let router = LaunchDetailsModuleRouter()

        presenter.view = view
        view.output = presenter
        presenter.router = router
        router.view = view

        return view
    }
}
