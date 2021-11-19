//
//  LaunchDetailsPresenter.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

final class LaunchDetailsPresenter {

    // MARK: - Properties
    weak var view: LaunchDetailsViewInput?
    var router: LaunchDetailsRouterInput?
    var launch: Launch?
    var service: LaunchesNetworkServiceProtocol?
}

// MARK: - LaunchDetailsModuleInput
extension LaunchDetailsPresenter: LaunchDetailsModuleInput {
    func configure(with launch: Launch, service: LaunchesNetworkServiceProtocol) {
        self.launch = launch
        self.service = service
    }
}

// MARK: - LaunchDetailsViewOutput
extension LaunchDetailsPresenter: LaunchDetailsViewOutput {
    func viewLoaded() {
        guard let launch = launch else { return }
        view?.setupInitialState(with: launch,
                                result: launch.success ?? false,
                                date: launch.dateLocal.convert(usingFullStyle: true),
                                resultInfo: launch.success ?? false ? "Success" : "Failed",
                                details: launch.details ?? "No information available")

        view?.setupLayout()
        view?.setupScrollView()
        view?.setupViews(with: launch.links.article == nil,
                         and: launch.links.wikipedia == nil)
        view?.setupActions()
        loadImages()
    }

    func loadImages() {
        let urls = launch?.links.flickr.original.compactMap { URL(string: $0) }
        var images = [UIImage]()
        let group = DispatchGroup()

        urls?.forEach {
            group.enter()
            service?.loadImage(from: $0, completion: { result in
                switch result {
                case .success(let image):
                    images.append(image)
                    group.leave()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            })
        }

        group.notify(queue: DispatchQueue.main) {
            if images.isEmpty { images.append(Images.placeholder) }
            self.view?.setupScrollView(with: images)
        }
    }
}

// MARK: - LaunchDetailsPresenterOutput
extension LaunchDetailsPresenter {
    func showArticle() {
        guard let stringURL = launch?.links.article,
              let url = URL(string: stringURL)
        else { return }
        router?.presentSafariModule(with: url)
    }

    func showWikipedia() {
        guard let stringURL = launch?.links.wikipedia,
              let url = URL(string: stringURL)
        else { return }
        router?.presentSafariModule(with: url)
    }

    func showRocketInfo() {
        guard let launch = launch else { return }
        router?.presentRocketModule(with: launch.rocketInfo)
    }

    func showLaunchpadInfo() {
        guard let launch = launch else { return }
        router?.presentLaunchpadModule(with: launch.launchpadInfo)
    }
}
