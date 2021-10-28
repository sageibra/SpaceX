//
//  FavoritesModulePresenter.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import UIKit

final class FavoritesModulePresenter {

    weak var view: FavoritesViewInput?
    var router: FavoritesRouterInput?

    // MARK: - Initialisation
    init() {

    }
}

// MARK: - View Output
extension FavoritesModulePresenter: FavoritesViewOutput {
    func viewLoaded() {
        //
    }
}
