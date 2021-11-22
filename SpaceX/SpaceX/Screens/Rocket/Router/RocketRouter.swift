//
//  RocketRouter.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

final class RocketRouter: RocketRouterInput {

	// MARK: - Properties
    weak var view: ModuleTransitionable?

	// MARK: - RocketRouterInput
    func dismissModule() {
        view?.dismissModule(animation: true, completion: nil)
    }

    func presentSafariModule(with url: URL) {
        let config = SafariViewModuleConfigurator()
        let module = config.configureModule(with: url)
        view?.presentModule(module: module, presentationStyle: .fullScreen, animation: true, completion: nil)
    }
}
