//
//  UserDefaults+Ext.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 18/11/2021.
//

import Foundation

extension UserDefaults {
    var theme: Theme {
        get { register(defaults: [#function: Theme.automatic.rawValue])
            return Theme(rawValue: integer(forKey: #function)) ?? .automatic
        }
        set {
            set(newValue.rawValue, forKey: #function)
        }
    }
}
