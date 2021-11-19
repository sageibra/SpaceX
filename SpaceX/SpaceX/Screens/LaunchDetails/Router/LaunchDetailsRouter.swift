//
//  LaunchDetailsRouter.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

final class LaunchDetailsRouter: LaunchDetailsRouterInput {

	// MARK: - Properties
    weak var view: ModuleTransitionable?

	// MARK: - LaunchDetailsRouterInput
    func presentSafariModule(with url: URL) {
        let config = SafariViewModuleConfigurator()
        let module = config.configureModule(with: url)
        view?.presentModule(module: module, presentationStyle: .fullScreen, animation: true, completion: nil)
    }

    func presentLaunchpadModule(with launchpad: Launchpad) {
        let config = LaunchpadModuleConfigurator()
        let module = config.configure(with: launchpad)
        view?.presentModule(module: module, presentationStyle: .popover, animation: true, completion: nil)
    }

    func presentRocketModule(with rocket: Rocket) {
        let config = RocketModuleConfigurator()
        let module = config.configure(with: rocket)
        view?.presentModule(module: module, presentationStyle: .popover, animation: true, completion: nil)
    }

}
