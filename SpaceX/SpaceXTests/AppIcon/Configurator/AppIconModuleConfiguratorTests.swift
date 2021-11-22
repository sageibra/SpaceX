//
//  AppIconModuleConfiguratorTests.swift
//  SpaceXTests
//
//  Created by Ibragim Akaev on 21/11/2021.
//

import XCTest
@testable import SpaceX

final class AppIconModuleConfiguratorTests: XCTestCase {
    let viewController = AppIconModuleConfigurator().configure()
    let presenter = AppIconPresenter()

    // MARK: - Main tests
    func testThatViewHasOutput() {
        XCTAssertNotNil(viewController.output, "AppIconViewController is nil after configuration")
    }

    func testThatViewHasCorrectOutput() {
        XCTAssertTrue(viewController.output is AppIconPresenter, "output is not AppIconPresenter")
    }

    func testThatViewOutputCanAssignWithPresenter() {
        guard let _: AppIconPresenter = viewController.output as? AppIconPresenter else {
            XCTFail("Cannot assign viewController.output as AppIconPresenter")
            return
        }
    }

    func testThatPresenterIsNotNil() {
        guard let presenter: AppIconPresenter = viewController.output as? AppIconPresenter else { return }
        XCTAssertNotNil(presenter.view, "view in AppIconPresenter is nil after configuration")
    }
}
