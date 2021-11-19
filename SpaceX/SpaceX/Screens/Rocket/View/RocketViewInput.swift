//
//  RocketViewInput.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

protocol RocketViewInput: AnyObject {
    func setupViews()
    func setupScrollView()
    func setupLayout()
    func setupInitialState(with rocket: Rocket)
}
