//
//  LaunchDetailsModuleConfigurator.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

final class LaunchDetailsModuleConfigurator {

    // MARK: - Internal methods
    func configure(with launch: Launch, service: LaunchesNetworkServiceProtocol) -> LaunchDetailsViewController {
        let view = LaunchDetailsViewController()
        let presenter = LaunchDetailsPresenter()
        presenter.configure(with: launch, service: service)
        let router = LaunchDetailsRouter()

        presenter.view = view
        presenter.router = router
        router.view = view
        view.output = presenter

        return view
    }

}
