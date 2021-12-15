//
//  DependencyContainer.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 19/11/2021.
//

import Foundation
import UIKit

final class DependencyContainer {
    lazy var networkService = LaunchesNetworkService()
    lazy var endpoint = Endpoint.launches()
    lazy var coreDataStack = CoreDataStack(modelName: "SpaceX")
    lazy var userDefaults = UserDefaults.standard
    lazy var application = UIApplication.shared
    lazy var dataBase = DataBaseService(coreDataStack: coreDataStack)
}

extension DependencyContainer: ViewControllerFactory {
    func makeRootViewController() -> UIViewController {
        let rootTabBarController = UITabBarController()
        rootTabBarController.viewControllers = [makeLaunchesViewController(), makeSettingsViewController()]
        return rootTabBarController
    }

    func makeLaunchesViewController() -> UIViewController {
        let launchesConfigurator = LaunchesModuleConfigurator()
        let launchesModule = launchesConfigurator.configure(with: self)
        launchesModule.tabBarItem = UITabBarItem(title: "Launches", image: Images.launchesIcon, tag: 0)
        return launchesModule
    }

    func makeSettingsViewController() -> UIViewController {
        let settingsConfigurator = SettingsModuleConfigurator()
        let settingsModule = settingsConfigurator.configure(with: self)
        settingsModule.tabBarItem = UITabBarItem(title: "Settings", image: Images.settingsIcon, tag: 1)
        return settingsModule
    }
}
