//
//  SettingsModuleInput.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 15/12/2021.
//

import Foundation

protocol SettingsModuleInput: AnyObject {
    func configure(with diContainer: DependencyContainer)
}
