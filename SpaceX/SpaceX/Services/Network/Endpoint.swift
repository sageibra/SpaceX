//
//  Launch.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import UIKit

protocol EndpointProtocol {
    static func launches() -> Endpoint
    var url: URL? { get }
}

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
}

extension Endpoint: EndpointProtocol {
    static func launches() -> Endpoint {
        return Endpoint(
            path: "/v4/launches",
            queryItems: []
        )
    }
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.spacexdata.com"
        components.path = path
        components.queryItems = queryItems

        return components.url
    }
}
