//
//  LaunchesModuleProtocols.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import Foundation

protocol LaunchesViewInput: AnyObject {
    func reload()
}

protocol LaunchesViewOutput: AnyObject {
    var model: [Launch] { get }
    var numberOfRows: Int { get }
    func viewLoaded()
    func configure(cell: LaunchCellViewInput, forRow row: Int)
    func didSelect(at row: Int)
}

protocol LaunchCellViewInput: AnyObject {
    func configure(mission: String, date: Int, location: String, rName: String, launchResult: Bool)
}

protocol LaunchesRouterInput: AnyObject {
    func presentDetailModule(with data: Launch)
}
