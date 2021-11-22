//
//  RocketModuleConfiguratorTests.swift
//  SpaceXTests
//
//  Created by Ibragim Akaev on 21/11/2021.
//

import XCTest
@testable import SpaceX

final class RocketModuleConfiguratorTests: XCTestCase {
    let viewController = RocketModuleConfigurator().configure(with: Rocket.unknown)
    let presenter = RocketPresenter()

    // MARK: - Main tests
    func testThatViewHasOutput() {
        XCTAssertNotNil(viewController.output, "RocketViewController is nil after configuration")
    }

    func testThatViewHasCorrectOutput() {
        XCTAssertTrue(viewController.output is RocketPresenter, "output is not RocketPresenter")
    }

    func testThatViewOutputCanAssignWithPresenter() {
        guard let _: RocketPresenter = viewController.output as? RocketPresenter else {
            XCTFail("Cannot assign viewController.output as RocketPresenter")
            return
        }
    }

    func testThatPresenterIsNotNil() {
        guard let presenter: RocketPresenter = viewController.output as? RocketPresenter else { return }
        XCTAssertNotNil(presenter.view, "view in RocketPresenter is nil after configuration")
    }

    func testThatRouterIsNotNil() {
        guard let presenter: RocketPresenter = viewController.output as? RocketPresenter else { return }
        XCTAssertNotNil(presenter.router, "router in RocketPresenter is nil after configuration")
    }

    func testThatPresenterHasCorrectRouter() {
        guard let presenter: RocketPresenter = viewController.output as? RocketPresenter else { return }
        XCTAssertTrue(presenter.router is RocketRouter, "router is not RocketRouter")
    }

    func testThatPresenterConformCorrectRouter() {
        guard let presenter: RocketPresenter = viewController.output as? RocketPresenter else { return }
        guard let _: RocketRouter = presenter.router as? RocketRouter else {
            XCTFail("Cannot assign presenter.router as RocketRouter")
            return
        }
    }

    func testThatViewHasCorrectRouter() {
        guard let router: RocketRouter = presenter.router as? RocketRouter else { return }
        XCTAssertTrue(router.view is RocketViewController, "view in router is not RocketViewController")
    }
}
