//
//  ThemeViewInput.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 18/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

protocol ThemeViewInput: AnyObject {
    func setupTableView()
    func reload()
}

protocol ThemeCellViewInput {
    func configure(with text: String)
}
