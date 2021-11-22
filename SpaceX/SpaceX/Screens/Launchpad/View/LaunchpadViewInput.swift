//
//  LaunchpadViewInput.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import MapKit

protocol LaunchpadViewInput: AnyObject {
    func setupViews()
    func setupScrollView()
    func setupLayout()
    func setupInitialState(launchpad: Launchpad, attempts: String,
                           successes: String, location: CLLocation, annotation: MKPointAnnotation)
}
