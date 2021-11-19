//
//  LaunchesPresenter.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

final class LaunchesPresenter {

    // MARK: - Properties
    weak var view: LaunchesViewInput?
    var router: LaunchesRouterInput?
    var service: LaunchesNetworkServiceProtocol?
    var endpoint: Endpoint?

    var model: [Launch] = []
    var unfiltered: [Launch] = []
}

// MARK: - LaunchesModuleInput
extension LaunchesPresenter: LaunchesModuleInput {
    func configure(with service: LaunchesNetworkServiceProtocol, and endpoint: Endpoint) {
        self.service = service
        self.endpoint = endpoint
    }
}

// MARK: - LaunchesViewOutput
extension LaunchesPresenter: LaunchesViewOutput {

    var numberOfRows: Int { model.count }

    func viewLoaded() {
        view?.setupCollectionView()
        view?.setupSegmentedControl()
        loadLaunches()
    }

    func loadLaunches() {
        guard let endpoint = endpoint else { return }
        service?.loadLaunches(endpoint) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let launches):
                    self.model = launches
                    self.unfiltered = launches
                    self.view?.reload()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }

    func loadImage(with string: String?) -> UIImage {
        guard let urlString = string, let url = URL(string: urlString) else { return Images.placeholderPatch }
        var image = Images.placeholderPatch

        service?.loadImage(from: url) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let responseImage):
                    image = responseImage
                case .failure(let error):
                    print(error)
                }
            }
        }
        return image
    }

    func segmentSelected(at index: Int) {
        if index == 0 {
            model = unfiltered
        } else {
            model = model.filter { $0.upcoming }
        }

        view?.reload()
    }
}

// MARK: - LaunchCellViewInput
extension LaunchesPresenter {
    func configure(cell: LaunchCellViewInput, forRow row: Int) {
        let launch = model[row]
        cell.configure(
            with: launch,
            date: launch.dateLocal.convert(usingFullStyle: false),
            location: launch.launchpadInfo.name,
            rocket: launch.rocketInfo.name,
            launchResult: launch.success ?? false
        )

        cell.configure(with: loadImage(with: launch.links.patch.small))
    }
}

// MARK: - LaunchesPresenterOutput
extension LaunchesPresenter {
    func didSelect(at row: Int) {
        let launch = model[row]
        guard let service = service else { return }
        router?.presentLaunchDetailsModule(with: launch, service: service)
    }
}
