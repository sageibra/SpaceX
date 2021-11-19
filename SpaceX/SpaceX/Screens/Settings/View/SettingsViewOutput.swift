//
//  SettingsViewOutput.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

protocol SettingsViewOutput {
    var numberOfSections: Int { get }
    func viewLoaded()
    func numberOfRows(for section: Int) -> Int
    func didSelect(at section: Int, and row: Int)
    func configure(cell: SettingsCellViewInput, with section: Int, and row: Int)
}
