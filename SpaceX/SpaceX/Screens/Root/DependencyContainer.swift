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
    private lazy var coreDataStack = CoreDataStack(modelName: "SpaceX")
    lazy var userDefaults = UserDefaults.standard
    lazy var dataBase = DataBaseService(coreDataStack: coreDataStack)
}

extension DependencyContainer: RootViewControllerFactory {
    func makeRootViewController() -> UIViewController {
        let rootTabBarController = UITabBarController()
        let launchesConfig = LaunchesModuleConfigurator()
        let launchesModule = launchesConfig.configure(with: networkService, and: endpoint, and: dataBase)
        let settingsConfig = SettingsModuleConfigurator()
        let settingsModule = settingsConfig.configure()
        rootTabBarController.viewControllers = [launchesModule, settingsModule]
        return rootTabBarController
    }
}
