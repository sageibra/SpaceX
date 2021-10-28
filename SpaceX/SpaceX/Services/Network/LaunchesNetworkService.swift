//
//  LaunchesNetworkService.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import Foundation

class LaunchesNetworkService {

    private var session: URLSession!
    private let configuration = URLSessionConfiguration.default
    private let decoder = JSONDecoder()

    init() { session = URLSession(configuration: configuration) }

    private func httpResponse(data: Data?, response: URLResponse?) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkServiceError.nonHTTPResponse
        }

        switch httpResponse.statusCode {
        case 200: return data ?? Data()
        case 400...499:
            throw NetworkServiceError.requestFailed(httpResponse.statusCode)
        case 500...599:
            throw NetworkServiceError.serverError(httpResponse.statusCode)
        default:
            fatalError("Unhandled HTTP Response Status code: \(httpResponse.statusCode)")
        }
    }
}

extension LaunchesNetworkService: LaunchesNetworkServiceProtocol {

    typealias Handler = (Data?, URLResponse?, Error?) -> Void

    func loadLaunches(_ endpoint: Endpoint, completion: @escaping (LoadLaunchesResponse) -> Void) {
        let request = URLRequest(url: endpoint.url!)
        let handler: Handler = { rawData, response, error in
            do {
                let data = try self.httpResponse(data: rawData, response: response)
                let response = try self.decoder.decode(Launch.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure((error as? NetworkServiceError) ?? .decodingError(error)))
            }
        }

        session.dataTask(with: request, completionHandler: handler).resume()
    }
}
