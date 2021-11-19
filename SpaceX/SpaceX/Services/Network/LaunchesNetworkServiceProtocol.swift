//
//  LoadLaunchesResponse.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import UIKit

typealias LoadLaunchesResponse = Result<[Launch], NetworkServiceError>
typealias LoadImageResponse = Result<UIImage, NetworkServiceError>

protocol LaunchesNetworkServiceProtocol {
    func loadLaunches(_ endpoint: Endpoint, completion: @escaping (LoadLaunchesResponse) -> Void)
    func loadImage(from url: URL, completion: @escaping (LoadImageResponse) -> Void)
}
