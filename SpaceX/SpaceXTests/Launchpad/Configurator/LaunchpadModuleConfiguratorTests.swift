//
//  LaunchpadModuleConfiguratorTests.swift
//  SpaceXTests
//
//  Created by Ibragim Akaev on 21/11/2021.
//

import XCTest
@testable import SpaceX

final class LaunchpadModuleConfiguratorTests: XCTestCase {
    let viewController = LaunchpadModuleConfigurator().configure(with: Launchpad.unknown)
    let presenter = LaunchpadPresenter()

    // MARK: - Main tests
    func testThatViewHasOutput() {
        XCTAssertNotNil(viewController.output, "LaunchpadViewController is nil after configuration")
    }

    func testThatViewHasCorrectOutput() {
        XCTAssertTrue(viewController.output is LaunchpadPresenter, "output is not LaunchpadPresenter")
    }

    func testThatViewOutputCanAssignWithPresenter() {
        guard let _: LaunchpadPresenter = viewController.output as? LaunchpadPresenter else {
            XCTFail("Cannot assign viewController.output as LaunchpadPresenter")
            return
        }
    }

    func testThatPresenterIsNotNil() {
        guard let presenter: LaunchpadPresenter = viewController.output as? LaunchpadPresenter else { return }
        XCTAssertNotNil(presenter.view, "view in LaunchpadPresenter is nil after configuration")
    }

    func testThatRouterIsNotNil() {
        guard let presenter: LaunchpadPresenter = viewController.output as? LaunchpadPresenter else { return }
        XCTAssertNotNil(presenter.router, "router in LaunchpadPresenter is nil after configuration")
    }

    func testThatPresenterHasCorrectRouter() {
        guard let presenter: LaunchpadPresenter = viewController.output as? LaunchpadPresenter else { return }
        XCTAssertTrue(presenter.router is LaunchpadRouter, "router is not LaunchpadRouter")
    }

    func testThatPresenterConformCorrectRouter() {
        guard let presenter: LaunchpadPresenter = viewController.output as? LaunchpadPresenter else { return }
        guard let _: LaunchpadRouter = presenter.router as? LaunchpadRouter else {
            XCTFail("Cannot assign presenter.router as LaunchpadRouter")
            return
        }
    }

    func testThatViewHasCorrectRouter() {
        guard let router: LaunchpadRouter = presenter.router as? LaunchpadRouter else { return }
        XCTAssertTrue(router.view is LaunchpadViewController, "view in router is not LaunchpadViewController")
    }
}
