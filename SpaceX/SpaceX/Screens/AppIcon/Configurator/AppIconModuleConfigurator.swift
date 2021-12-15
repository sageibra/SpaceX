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
    func configure(with application: UIApplication) -> AppIconViewController {
        let view = AppIconViewController()
        let presenter = AppIconPresenter()
        presenter.configure(with: application)
        presenter.view = view
        view.output = presenter

        return view
    }
}
