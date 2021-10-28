//
//  RocketsModulePresenter.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import UIKit

final class RocketsModulePresenter {

    weak var view: RocketsViewInput?
    var router: RocketsRouterInput?

    // MARK: - Initialisation
    init() {

    }
}

// MARK: - View Output
extension RocketsModulePresenter: RocketsViewOutput {
    func viewLoaded() {
        //
    }
}
