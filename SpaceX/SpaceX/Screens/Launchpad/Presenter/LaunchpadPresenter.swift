//
//  LaunchpadPresenter.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import MapKit

final class LaunchpadPresenter {

    // MARK: - Properties
    weak var view: LaunchpadViewInput?
    var router: LaunchpadRouterInput?
    var launchpad: Launchpad?
}

// MARK: - LaunchpadModuleInput
extension LaunchpadPresenter: LaunchpadModuleInput {
    func configure(with launchpad: Launchpad) {
        self.launchpad = launchpad
    }
}

// MARK: - LaunchpadViewOutput
extension LaunchpadPresenter: LaunchpadViewOutput {
    func viewLoaded() {
        guard let launchpad = launchpad else { return }
        view?.setupInitialState(launchpad: launchpad,
                                attempts: String(launchpad.launchAttempts),
                                successes: String(launchpad.launchSuccesses),
                                location: CLLocation(latitude: launchpad.latitude, longitude: launchpad.longitude),
                                annotation: createAnnotation())

        view?.setupViews()
        view?.setupScrollView()
        view?.setupLayout()
    }

    func createAnnotation() -> MKPointAnnotation {
        guard let latitude = launchpad?.latitude,
              let longitude = launchpad?.longitude else { return MKPointAnnotation() }
        let annotation = MKPointAnnotation()
        annotation.title = launchpad?.locality
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        return annotation
    }
}

// MARK: - LaunchpadPresenterOutput
extension LaunchpadPresenter {
    func dismissModule() {
        router?.dismissModule()
    }
}
