//
//  Launch.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import Foundation

struct Launch: Decodable {
    let missionName: String
    let launchDateUnix: Int
    let flightNumber: Int
    let rocket: RocketInfo
    let launchSite: LaunchSite
    let launchSuccess: Bool?
    let links: Links
    let details: String?
}

// MARK: - LaunchSite
struct LaunchSite: Decodable {
    let siteName: String
}

// MARK: - Links
struct Links: Decodable {
    let missionPatch: String?
    let articleLink: String?
    let videoLink: String?
}

// MARK: - RocketInfo
struct RocketInfo: Decodable {
    let rocketName: String
    let rocketType: String
}
