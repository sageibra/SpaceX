//
//  LaunchDetailsModuleRouter.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 29/10/2021.
//

import UIKit
import WebKit

final class LaunchDetailsModuleRouter: LaunchDetailsRouterInput {

    weak var view: ModuleTransitionable?

    // MARK: - Router Input
    func presentWebView(url: String) {
        let articleVC = ArticleViewController(articleUrl: url)
        view?.pushModule(module: articleVC, animation: true)
    }
}
