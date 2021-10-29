//
//  LaunchDetailsModulePresenter.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 29/10/2021.
//

import UIKit

final class LaunchDetailsModulePresenter {

    weak var view: LaunchDetailsViewInput?
    var router: LaunchDetailsRouterInput?
    var launchInfo: Launch

    // MARK: - Initialisation
    init(launchInfo: Launch) {
        self.launchInfo = launchInfo
    }
}

// MARK: - View Output
extension LaunchDetailsModulePresenter: LaunchDetailsViewOutput {

    var title: String { return launchInfo.missionName }

    func viewLoaded() {}
    func presentWebView() {
        router?.presentWebView(url: launchInfo.links.articleLink ?? "www.apple.com")
    }
}
