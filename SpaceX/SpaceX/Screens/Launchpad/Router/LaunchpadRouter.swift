//
//  LaunchpadRouter.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

final class LaunchpadRouter: LaunchpadRouterInput {

	// MARK: - Properties
    weak var view: ModuleTransitionable?

	// MARK: - LaunchpadRouterInput
    func dismissModule() {
        view?.dismissModule(animation: true, completion: nil)
    }
}
