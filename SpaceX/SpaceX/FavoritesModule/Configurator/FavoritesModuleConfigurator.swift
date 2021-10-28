//
//  FavoritesModuleConfigurator.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import UIKit

enum FavoritesModuleConfigurator {

    static func configureModule() -> FavoritesViewController {
        let view = FavoritesViewController()
        view.tabBarItem = UITabBarItem(title: "Favorites", image: Images.favoriteIcon, tag: 3)
        let presenter = FavoritesModulePresenter()
        let router = FavoritesModuleRouter()

        presenter.view = view
        view.output = presenter
        presenter.router = router
        router.view = view

        return view
    }
}
