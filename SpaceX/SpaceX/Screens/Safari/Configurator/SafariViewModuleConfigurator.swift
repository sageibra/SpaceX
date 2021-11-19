//
//  SafariViewModuleConfigurator.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 05/11/2021.
//

import UIKit
import SafariServices

final class SafariViewModuleConfigurator {

    // MARK: - Internal methods
    func configureModule(with url: URL) -> SafariViewController {
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        config.barCollapsingEnabled = false
        let view = SafariViewController(url: url, configuration: config)

        return view
    }
}
