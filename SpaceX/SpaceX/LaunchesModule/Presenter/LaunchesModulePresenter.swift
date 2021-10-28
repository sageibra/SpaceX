//
//  LaunchesModulePresenter.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import UIKit

final class LaunchesModulePresenter {

    weak var view: LaunchesViewInput?
    var router: LaunchesRouterInput?

    // MARK: - Initialisation
    init() {

    }
}

// MARK: - View Output
extension LaunchesModulePresenter: LaunchesViewOutput {
    func presentDetailView() {}

    func viewLoaded() {}
}
