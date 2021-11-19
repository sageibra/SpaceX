//
//  LaunchDetailsRouterInput.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import Foundation

protocol LaunchDetailsRouterInput {
    func presentSafariModule(with url: URL)
    func presentLaunchpadModule(with launchpad: Launchpad)
    func presentRocketModule(with rocket: Rocket)
}
