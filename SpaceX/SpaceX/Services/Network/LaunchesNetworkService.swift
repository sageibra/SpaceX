//
//  LaunchesNetworkService.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import UIKit

final class LaunchesNetworkService {

    private var cache = NSCache<NSString, UIImage>()
    private let session = URLSession(configuration: .default)
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

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

    func loadLaunches(_ endpoint: EndpointProtocol, completion: @escaping (LoadLaunchesResponse) -> Void) {
        guard let url = endpoint.url else {
            completion(.failure(NetworkServiceError.incorrectUrl))
            return
        }

        let request = URLRequest(url: url)

        let handler: Handler = { rawData, response, error in
            do {
                let data = try self.httpResponse(data: rawData, response: response)
                let response = try self.decoder.decode([Launch].self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure((error as? NetworkServiceError) ?? .decodingError(error)))
            }
        }

        session.dataTask(with: request, completionHandler: handler).resume()
    }

    func loadImage(from url: URL, completion: @escaping (LoadImageResponse) -> Void) {
        let cacheKey = NSString(string: url.absoluteString)
        if let image = cache.object(forKey: cacheKey) {
            completion(.success(image))
            return
        }

        let request = URLRequest(url: url)

        let handler: Handler = { rawData, response, error in
            do {
                let data = try self.httpResponse(data: rawData, response: response)
                guard let image = UIImage(data: data) else { return }
                self.cache.setObject(image, forKey: cacheKey)
                completion(.success(image))
            } catch {
                completion(.failure((error as? NetworkServiceError) ?? .decodingError(error)))
            }
        }

        session.dataTask(with: request, completionHandler: handler).resume()
    }
}
