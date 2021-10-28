//
//  NetworkServiceError.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

enum NetworkServiceError: Error, CustomStringConvertible {
    case nonHTTPResponse
    case requestFailed(Int)
    case serverError(Int)
    case networkError(Error)
    case decodingError(Error)

    var description: String {
        switch self {
        case .nonHTTPResponse: return "Non-HTTP response received"
        case .requestFailed(let status): return "Received HTTP \(status)"
        case .serverError(let status): return "Server Error - \(status)"
        case .networkError(let error): return "Failed to load the request: \(error)"
        case .decodingError(let decError): return "Failed to process response: \(decError)"
        }
    }
}
