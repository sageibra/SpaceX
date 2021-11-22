//
//  RocketRouterInput.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import Foundation

protocol RocketRouterInput {
    func dismissModule()
    func presentSafariModule(with url: URL)
}
