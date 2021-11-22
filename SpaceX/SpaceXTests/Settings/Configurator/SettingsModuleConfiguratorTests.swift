//
//  SettingsModuleConfiguratorTests.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 20/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import XCTest
@testable import SpaceX

final class SettingsModuleConfiguratorTests: XCTestCase {
    let viewController = SettingsModuleConfigurator().configure()
    let presenter = SettingsPresenter()

	// MARK: - Main tests
    func testThatViewHasOutput() {
        XCTAssertNotNil(viewController.output, "SettingsViewController is nil after configuration")
    }

    func testThatViewHasCorrectOutput() {
        XCTAssertTrue(viewController.output is SettingsPresenter, "output is not SettingsPresenter")
    }

    func testThatViewOutputCanAssignWithPresenter() {
        guard let _: SettingsPresenter = viewController.output as? SettingsPresenter else {
            XCTFail("Cannot assign viewController.output as SettingsPresenter")
            return
        }
    }

    func testThatPresenterIsNotNil() {
        guard let presenter: SettingsPresenter = viewController.output as? SettingsPresenter else { return }
        XCTAssertNotNil(presenter.view, "view in SettingsPresenter is nil after configuration")
    }

    func testThatRouterIsNotNil() {
        guard let presenter: SettingsPresenter = viewController.output as? SettingsPresenter else { return }
        XCTAssertNotNil(presenter.router, "router in SettingsPresenter is nil after configuration")
    }

    func testThatPresenterHasCorrectRouter() {
        guard let presenter: SettingsPresenter = viewController.output as? SettingsPresenter else { return }
        XCTAssertTrue(presenter.router is SettingsRouter, "router is not SettingsRouter")
    }

    func testThatPresenterConformCorrectRouter() {
        guard let presenter: SettingsPresenter = viewController.output as? SettingsPresenter else { return }
        guard let _: SettingsRouter = presenter.router as? SettingsRouter else {
            XCTFail("Cannot assign presenter.router as SettingsRouter")
            return
        }
    }

    func testThatViewHasCorrectRouter() {
        guard let router: SettingsRouter = presenter.router as? SettingsRouter else { return }
        XCTAssertTrue(router.view is SettingsViewController, "view in router is not SettingsViewController")
    }
}
