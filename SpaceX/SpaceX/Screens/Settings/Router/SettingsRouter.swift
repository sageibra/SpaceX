//
//  SettingsRouter.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

final class SettingsRouter: SettingsRouterInput {

    // MARK: - Properties
    weak var view: ModuleTransitionable?

    // MARK: - SettingsRouterInput
    func presentAppIconModule(with application: UIApplication) {
        let config = AppIconModuleConfigurator()
        let module = config.configure(with: application)
        view?.pushModule(module: module, animation: true)
    }

    func presentThemeModule(with userDefaults: UserDefaults, and application: UIApplication) {
        let config = ThemeModuleConfigurator()
        let module = config.configure(with: userDefaults, and: application)
        view?.pushModule(module: module, animation: true)
    }

    func presentSafariModule(with url: URL) {
        let config = SafariViewModuleConfigurator()
        let module = config.configureModule(with: url)
        view?.presentModule(module: module, presentationStyle: .fullScreen, animation: true, completion: nil)
    }
}
