//
//  LaunchpadModuleConfigurator.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

final class LaunchpadModuleConfigurator {

    // MARK: - Internal methods
    func configure(with launchpad: Launchpad) -> LaunchpadViewController {
        let view = LaunchpadViewController()
        let presenter = LaunchpadPresenter()
        presenter.configure(with: launchpad)
        let router = LaunchpadRouter()

        presenter.view = view
        presenter.router = router
        router.view = view
        view.output = presenter

        return view
    }

}
