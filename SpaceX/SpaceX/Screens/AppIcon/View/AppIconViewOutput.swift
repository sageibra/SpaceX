//
//  AppIconViewOutput.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 17/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

protocol AppIconViewOutput {
    var numberOfRows: Int { get }
    func viewLoaded()
    func didSelect(at row: Int)
    func configure(cell: AppIconCellViewInput, with row: Int)
    func currentIconIndex() -> Int
}
