//
//  ThemeViewOutput.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 18/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

protocol ThemeViewOutput {
    var numberOfRows: Int { get }
    var theme: Theme { get set }
    func viewLoaded()
    func didSelect(at row: Int)
    func configure(cell: ThemeCellViewInput, with row: Int)
}
