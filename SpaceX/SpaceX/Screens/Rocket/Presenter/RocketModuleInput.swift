//
//  RocketModuleInput.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

protocol RocketModuleInput: AnyObject {
    func configure(with rocket: Rocket)
}
