//
//  Rocket.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import Foundation

// MARK: - Rocket
struct Rocket: Decodable {
    let successRatePct: Int
    let country: String
    let company: String
    let flickrImages: [String]
    let wikipedia: String
    let rocketDescription: String
    let rocketName: String
    let rocketType: String
}
