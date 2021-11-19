//
//  SettingsViewInput.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

protocol SettingsViewInput: AnyObject {
    func setupTableView()
    func reload()
}

protocol SettingsCellViewInput: AnyObject {
    func configure(with text: String, icon: UIImage)
}
