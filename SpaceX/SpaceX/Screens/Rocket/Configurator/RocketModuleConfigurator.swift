//
//  RocketModuleConfigurator.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

final class RocketModuleConfigurator {

    // MARK: - Internal methods
    func configure(with rocket: Rocket) -> RocketViewController {
        let view = RocketViewController()
        let presenter = RocketPresenter()
        presenter.configure(with: rocket)
        let router = RocketRouter()

        presenter.view = view
        presenter.router = router
        router.view = view
        view.output = presenter

        return view
    }
}
