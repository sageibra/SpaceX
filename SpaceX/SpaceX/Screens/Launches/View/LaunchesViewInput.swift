//
//  LaunchesViewInput.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

protocol LaunchesViewInput: AnyObject {
    var activityToggle: Bool { get set }
    func setupCollectionView()
    func setupSegmentedControl()
    func setupActivityIndicator()
    func setupAlertView(with title: String, and message: String)
    func reload()
}

protocol LaunchCellViewInput {
    func configure(with launch: Launch, date: String, location: String, rocket: String, launchResult: Bool)
    func configure(with image: UIImage)
}
