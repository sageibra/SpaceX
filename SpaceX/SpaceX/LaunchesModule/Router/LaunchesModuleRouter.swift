//
//  LaunchesModuleRouter.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import UIKit

final class LaunchesModuleRouter: LaunchesRouterInput {

    weak var view: ModuleTransitionable?

    // MARK: - Router Input

    func dismissDetailModule(animation: Bool) {
        print("Router dismissDetailModule")
    }
//    func showDateModule(with model: LaunchesModulePresenter.DateViewModel) {
//        let dateVC = DateModuleConfigurator.configurateModule(with: model)
//
//        let navController = UINavigationController(rootViewController: dateVC)
//
//        view?.presentModule(module: navController, animation: true, completion: nil)
//    }

//    func dismissDetailModule(animation: Bool) {
//        view?.dismissModule(animation: animation, completion: nil)
//    }

}
