//
//  LaunchesModuleRouter.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import UIKit

final class LaunchesModuleRouter: LaunchesRouterInput {

    weak var view: ModuleTransitionable?

    // MARK: - Router Input
    func presentDetailModule(with data: Launch) {
        let detailsVC = LaunchDetailsModuleConfigurator.configureModule(data)
        view?.pushModule(module: detailsVC, animation: true)
    }
}
