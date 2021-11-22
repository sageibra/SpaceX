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
    let container = DependencyContainer()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        container.dataBase.coreDataStack.load()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(
            rootViewController: container.makeRootViewController()
        )
        window?.overrideUserInterfaceStyle = container.userDefaults.theme.userInterfaceStyle
        window?.makeKeyAndVisible()
        return true
    }
}
