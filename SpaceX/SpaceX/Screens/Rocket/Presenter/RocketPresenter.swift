//
//  RocketPresenter.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import Foundation

final class RocketPresenter {

    // MARK: - Properties
    weak var view: RocketViewInput?
    var router: RocketRouterInput?
    var rocket: Rocket?
}

// MARK: - RocketModuleInput
extension RocketPresenter: RocketModuleInput {
    func configure(with rocket: Rocket) {
        self.rocket = rocket
    }
}

// MARK: - RocketViewOutput
extension RocketPresenter: RocketViewOutput {
    func viewLoaded() {
        guard let rocket = rocket else { return }
        view?.setupInitialState(with: rocket)
        view?.setupViews()
        view?.setupScrollView()
        view?.setupLayout()
    }

    func showSafariModule() {
        guard let urlString = rocket?.wikipedia,
              let url = URL(string: urlString) else { return }
        router?.presentSafariModule(with: url)
    }
}

// MARK: - RocketPresenterOutput
extension RocketPresenter {
    func dismissModule() {
        router?.dismissModule()
    }
}
