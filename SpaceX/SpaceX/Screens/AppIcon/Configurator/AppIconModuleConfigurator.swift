//
//  AppIconModuleConfigurator.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 17/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

final class AppIconModuleConfigurator {

    // MARK: - Internal methods
    func configure() -> AppIconViewController {
        let view = AppIconViewController()
        let presenter = AppIconPresenter()
        presenter.configure(with: UIApplication.shared)
        presenter.view = view
        view.output = presenter

        return view
    }
}
