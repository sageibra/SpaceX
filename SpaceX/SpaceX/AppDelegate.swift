//
//  AppDelegate.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 26/10/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let rootTabBarController = UITabBarController()
        rootTabBarController.viewControllers = createTabBarControllers()
        window?.rootViewController = UINavigationController(rootViewController: rootTabBarController)
        window?.makeKeyAndVisible()
        return true
    }

    private func createTabBarControllers() -> [UIViewController] {
        let service = LaunchesNetworkService()
        let endpoint = Endpoint.launches()
        var controllers: [UIViewController] = []
        let launchesViewController = LaunchesModuleConfigurator.configureModule(service: service, endpoint: endpoint)
        let rocketsViewController = RocketsModuleConfigurator.configureModule()
        let favoritesViewController = FavoritesModuleConfigurator.configureModule()
        controllers = [launchesViewController, rocketsViewController, favoritesViewController]
        return controllers
    }
}
