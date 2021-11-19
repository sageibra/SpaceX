//
//  DependencyContainer.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 19/11/2021.
//

import Foundation
import UIKit

final class DependencyContainer {
    private lazy var networkService = LaunchesNetworkService()
    private lazy var endpoint = Endpoint.launches()
    lazy var userDefaults = UserDefaults.standard
}

extension DependencyContainer: RootViewControllerFactory {
    func makeRootViewController() -> UIViewController {
        let rootTabBarController = UITabBarController()
        let launchesConfig = LaunchesModuleConfigurator()
        let launchesModule = launchesConfig.configure(service: networkService, endpoint: endpoint)
        let settingsConfig = SettingsModuleConfigurator()
        let settingsModule = settingsConfig.configure()
        rootTabBarController.viewControllers = [launchesModule, settingsModule]
        return rootTabBarController
    }
}
