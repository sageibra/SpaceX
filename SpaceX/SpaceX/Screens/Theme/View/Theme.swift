//
//  Theme.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 18/11/2021.
//

import UIKit

enum Theme: Int, CaseIterable {
    case automatic
    case light
    case dark

    var title: String {
        switch self {
        case .automatic: return "Automatic"
        case .light: return "Light"
        case .dark: return "Dark"
        }
    }

    var userInterfaceStyle: UIUserInterfaceStyle {
        switch self {
        case .automatic: return .unspecified
        case .light: return .light
        case .dark: return .dark
        }
    }
}
