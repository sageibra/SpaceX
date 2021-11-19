//
//  Launch.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import Foundation

struct Launch: Decodable {
    let links: Links
    let rocket: String
    let success: Bool?
    let details: String?
    let launchpad: String
    let name: String
    let dateLocal: String
    let upcoming: Bool

    var rocketInfo: Rocket {
        switch rocket {
        case "5e9d0d95eda69955f709d1eb": return Rocket.falcon1
        case "5e9d0d95eda69973a809d1ec": return Rocket.falcon9
        case "5e9d0d95eda69974db09d1ed": return Rocket.falconHeavy
        default: return Rocket.unknown
        }
    }

    var launchpadInfo: Launchpad {
        switch launchpad {
        case "5e9e4501f509094ba4566f84": return Launchpad.capeCanaveral40
        case "5e9e4502f509092b78566f87": return Launchpad.vandenbergSFB
        case "5e9e4502f509094188566f88": return Launchpad.capeCanaveral
        case "5e9e4502f5090995de566f86": return Launchpad.omelekIsland
        default: return Launchpad.unknown
        }
    }
}

// MARK: - Links
struct Links: Decodable {
    let patch: Patch
    let flickr: Flickr
    let article: String?
    let wikipedia: String?
}

// MARK: - Flickr
struct Flickr: Decodable {
    let original: [String]
}

// MARK: - Patch
struct Patch: Decodable {
    let small: String?
}
