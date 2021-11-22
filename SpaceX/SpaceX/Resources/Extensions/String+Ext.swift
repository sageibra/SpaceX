//
//  String+Ext.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 12/11/2021.
//

import Foundation

extension String {
    func convert(usingFullStyle: Bool) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        guard let date = dateFormatter.date(from: self) else { return "" }
        dateFormatter.dateFormat = usingFullStyle ? "dd MMM yyyy, h:mm a" : "dd MMM yyyy"
        let convertedDate = dateFormatter.string(from: date)
        return convertedDate
    }
}
