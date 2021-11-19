//
//  SettingsDataSource.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 15/11/2021.
//

import UIKit

protocol RowProtocol {
    var text: String { get }
    var icon: UIImage { get }
}

enum Section: Int, CaseIterable {
    case main
    case links

    var rows: [RowProtocol] {
        switch self {
        case .main:
            return MainSectionRows.allCases
        case .links:
            return LinksSectionRows.allCases
        }
    }
}

enum MainSectionRows: Int, RowProtocol, CaseIterable {
    case theme
    case appIcon

    var text: String {
        switch self {
        case .theme: return "Theme"
        case .appIcon: return "App Icon"
        }
    }

    var icon: UIImage {
        switch self {
        case .theme: return Images.themeIcon
        case .appIcon: return Images.appIcon
        }
    }
}

enum LinksSectionRows: Int, RowProtocol, CaseIterable {
    case followMeOnTwitter
    case followMeOnGithub
    case spaceXApi

    var text: String {
        switch self {
        case .followMeOnTwitter: return "Follow me on Twitter"
        case .followMeOnGithub: return "Follow me on Github"
        case .spaceXApi: return "SpaceX Api"
        }
    }

    var icon: UIImage {
        switch self {
        case .followMeOnTwitter: return Images.twitterIcon
        case .followMeOnGithub: return Images.githubIcon
        case .spaceXApi: return Images.githubIcon
        }
    }
}
