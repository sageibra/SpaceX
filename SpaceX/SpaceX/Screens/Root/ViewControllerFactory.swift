//
//  ViewControllerFactory.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 19/11/2021.
//

import UIKit

protocol ViewControllerFactory {
    func makeRootViewController() -> UIViewController
    func makeLaunchesViewController() -> UIViewController
    func makeSettingsViewController() -> UIViewController
}
