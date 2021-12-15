//
//  SettingsRouterInput.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

protocol SettingsRouterInput {
    func presentAppIconModule(with application: UIApplication)
    func presentThemeModule(with userDefaults: UserDefaults, and application: UIApplication)
    func presentSafariModule(with url: URL)
}
