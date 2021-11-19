//
//  ThemeModuleInput.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 19/11/2021.
//

import UIKit

protocol ThemeModuleInput: AnyObject {
    func configure(with userDefaults: UserDefaults, and application: UIApplication)
}
