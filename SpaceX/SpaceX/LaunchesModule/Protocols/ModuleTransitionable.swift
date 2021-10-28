//
//  ModuleTransitionable.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import UIKit

protocol ModuleTransitionable: AnyObject {
    func presentModule(module: UIViewController, animation: Bool, completion: (() -> Void)?)
    func dismissModule(animation: Bool, completion: (() -> Void)?)
    func pushModule(module: UIViewController, animation: Bool)
    func popModule(animation: Bool)
}

extension ModuleTransitionable where Self: UIViewController {

    func presentModule(module: UIViewController, animation: Bool, completion: (() -> Void)?) {
        module.modalPresentationStyle = .fullScreen
        self.present(module, animated: animation, completion: completion)
    }

    func dismissModule(animation: Bool, completion: (() -> Void)?) {
        self.dismiss(animated: animation, completion: completion)
    }

    func pushModule(module: UIViewController, animation: Bool) {
        self.navigationController?.pushViewController(module, animated: true)
    }

    func popModule(animation: Bool) {
        self.navigationController?.popViewController(animated: animation)
    }
}
