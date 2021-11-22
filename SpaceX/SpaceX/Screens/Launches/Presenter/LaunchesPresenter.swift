//
//  LaunchesPresenter.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit
import CoreData

final class LaunchesPresenter {

    // MARK: - Properties
    weak var view: LaunchesViewInput?
    var router: LaunchesRouterInput?
    var service: LaunchesNetworkServiceProtocol?
    var endpoint: EndpointProtocol?
    var dataBase: DataBaseServiceProtocol?

    var model: [Launch] = []
    var unfiltered: [Launch] = []
}

// MARK: - LaunchesModuleInput
extension LaunchesPresenter: LaunchesModuleInput {
    func configure(with service: LaunchesNetworkServiceProtocol,
                   and endpoint: EndpointProtocol,
                   and dataBase: DataBaseServiceProtocol) {
        self.service = service
        self.endpoint = endpoint
        self.dataBase = dataBase
    }
}

// MARK: - LaunchesViewOutput
extension LaunchesPresenter: LaunchesViewOutput {

    var numberOfRows: Int { model.count }

    func viewLoaded() {
        view?.setupCollectionView()
        view?.setupSegmentedControl()
        view?.setupActivityIndicator()
        view?.activityToggle.toggle()
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
                    self.view?.activityToggle.toggle()
                    self.dataBase?.update(launches: launches)
                case .failure:
                    self.model = self.dataBase?.launches() ?? []
                    self.unfiltered = self.model
                    self.view?.activityToggle.toggle()
                    self.view?.reload()
                    self.view?.setupAlertView(with: "Something went wrong",
                                              and: "Please check your internet connection, to receive relevant data!")
                }
            }
        }
    }

    func loadImage(with string: String?, completion: @escaping (UIImage) -> Void) {
        guard let urlString = string, let url = URL(string: urlString) else {
            completion(Images.placeholderPatch)
            return
        }

        service?.loadImage(from: url) { result in
            switch result {
            case .success(let responseImage):
                completion(responseImage)
            case .failure:
                completion(Images.placeholderPatch)
            }
        }
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

        loadImage(with: launch.links.patch.small) { image in
            DispatchQueue.main.async { cell.configure(with: image) }
        }
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
