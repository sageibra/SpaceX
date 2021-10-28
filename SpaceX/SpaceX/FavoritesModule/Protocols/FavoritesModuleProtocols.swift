//
//  FavoritesModuleProtocols.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import Foundation

protocol FavoritesViewInput: AnyObject {}

protocol FavoritesViewOutput: AnyObject {
    func viewLoaded()
}

protocol FavoritesRouterInput: AnyObject {}
