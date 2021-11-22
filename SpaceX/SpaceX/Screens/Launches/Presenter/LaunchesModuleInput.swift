//
//  LaunchesModuleInput.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

protocol LaunchesModuleInput: AnyObject {
    func configure(with service: LaunchesNetworkServiceProtocol,
                   and endpoint: EndpointProtocol,
                   and dataBase: DataBaseServiceProtocol)
}
