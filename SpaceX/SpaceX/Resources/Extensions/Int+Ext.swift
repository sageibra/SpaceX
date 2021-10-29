//
//  Int+Ext.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 29/10/2021.
//

import Foundation

extension Int {

    func convertDate() -> String {
        let date = Date(timeIntervalSince1970: Double(self))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
}
