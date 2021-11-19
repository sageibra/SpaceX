//
//  LaunchesRouter.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

final class LaunchesRouter: LaunchesRouterInput {

	// MARK: - Properties
    weak var view: ModuleTransitionable?

	// MARK: - LaunchesRouterInput
    func presentLaunchDetailsModule(with launch: Launch, service: LaunchesNetworkServiceProtocol) {
        let config = LaunchDetailsModuleConfigurator()
        let module = config.configure(with: launch, service: service)
        view?.pushModule(module: module, animation: true)
    }
}
