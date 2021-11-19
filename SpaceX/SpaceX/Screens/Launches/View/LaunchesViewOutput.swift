//
//  LaunchesViewOutput.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

protocol LaunchesViewOutput {
    var model: [Launch] { get }
    var numberOfRows: Int { get }
    func viewLoaded()
    func configure(cell: LaunchCellViewInput, forRow row: Int)
    func didSelect(at row: Int)
    func segmentSelected(at index: Int)
}
