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
    func configure(with diContainer: DependencyContainer) -> LaunchesViewController {
        let view = LaunchesViewController()
        let presenter = LaunchesPresenter()
        presenter.configure(with: diContainer)
        let router = LaunchesRouter()

        presenter.view = view
        presenter.router = router
        router.view = view
        view.output = presenter

        return view
    }

}
