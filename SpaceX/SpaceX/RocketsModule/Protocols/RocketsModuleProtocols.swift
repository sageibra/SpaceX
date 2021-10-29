//
//  RocketsModuleProtocols.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import Foundation

protocol RocketsViewInput: AnyObject {
    func reload()
}

protocol RocketsViewOutput: AnyObject {
    func viewLoaded()
}

protocol RocketsRouterInput: AnyObject {}
