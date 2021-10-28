//
//  LaunchesModuleProtocols.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import Foundation

protocol LaunchesViewInput: AnyObject {}

protocol LaunchesViewOutput: AnyObject {
    func viewLoaded()
    func presentDetailView()
}

protocol LaunchesRouterInput: AnyObject {}
