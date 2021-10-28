//
//  RocketsModuleProtocols.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import Foundation

protocol RocketsViewInput: AnyObject {}

protocol RocketsViewOutput: AnyObject {
    func viewLoaded()
}

protocol RocketsRouterInput: AnyObject {}
