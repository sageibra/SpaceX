//
//  LaunchDetailsModuleProtocols.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 29/10/2021.
//

import Foundation

protocol LaunchDetailsViewInput: AnyObject {
    func reload()
}

protocol LaunchDetailsViewOutput: AnyObject {
    func viewLoaded()
    var title: String { get }
    func presentWebView()
}

protocol LaunchDetailsRouterInput: AnyObject {
    func presentWebView(url: String)
}
