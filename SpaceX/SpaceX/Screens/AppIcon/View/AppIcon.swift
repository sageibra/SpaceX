//
//  AppIcon.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 17/11/2021.
//

import UIKit

enum AppIcon: Int, CaseIterable {
    case classic
    case globe
    case rocket
    case dragon

    var name: String? {
        switch self {
        case .classic: return nil
        case .globe: return "globeIcon"
        case .rocket: return "rocketIcon"
        case .dragon: return "dragonIcon"
        }
    }

    var text: String {
        switch self {
        case .classic: return "Default"
        case .globe: return "Globe"
        case .rocket: return "Rocket"
        case .dragon: return "Dragon"
        }
    }

    var preview: UIImage {
        switch self {
        case .classic: return Images.classicIcon
        case .globe: return Images.globeIcon
        case .rocket: return Images.rocketIcon
        case .dragon: return Images.dragonIcon
        }
    }

    var icon: UIImage {
        switch self {
        case .classic: return Images.classic
        case .globe: return Images.globe
        case .rocket: return Images.rockets
        case .dragon: return Images.dragon
        }
    }
}
