//
//  LaunchesModulePresenter.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import UIKit

final class LaunchesModulePresenter {

    weak var view: LaunchesViewInput?
    var router: LaunchesRouterInput?
    var model: [Launch] = []
    var service: LaunchesNetworkServiceProtocol
    var endpoint: Endpoint

    // MARK: - Initialisation
    init(service: LaunchesNetworkServiceProtocol, endpoint: Endpoint) {
        self.service = service
        self.endpoint = endpoint
    }
}

// MARK: - View Output
extension LaunchesModulePresenter: LaunchesViewOutput {

    var numberOfRows: Int { model.count }

    func viewLoaded() { loadLaunches() }

    func configure(cell: LaunchCellViewInput, forRow row: Int) {
        let launch = model[row]

        cell.configure(
            mission: launch.name,
            date: launch.dateUnix.convertDate(),
            location: launch.launchpadInfo.name,
            rName: launch.rocketInfo.name,
            launchResult: launch.success ?? false
        )
    }

    func loadLaunches() {
        service.loadLaunches(endpoint) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let launches):
                    self.model = launches
                    self.view?.reload()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }

    func didSelect(at row: Int) {
        let launch = model[row]
        router?.presentDetailModule(with: launch)
    }
}
