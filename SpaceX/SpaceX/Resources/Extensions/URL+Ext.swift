//
//  URL+Ext.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 19/11/2021.
//

import Foundation

extension URL {
    init(staticString string: StaticString) {
        guard let url = URL(string: "\(string)") else {
            preconditionFailure("Invalid static URL string: \(string)")
        }

        self = url
    }
}
