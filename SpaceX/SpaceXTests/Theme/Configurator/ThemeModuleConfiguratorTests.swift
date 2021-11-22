//
//  ThemeModuleConfiguratorTests.swift
//  SpaceXTests
//
//  Created by Ibragim Akaev on 21/11/2021.
//

import XCTest
@testable import SpaceX

final class ThemeModuleConfiguratorTests: XCTestCase {
    let viewController = ThemeModuleConfigurator().configure()
    let presenter = ThemePresenter()

    // MARK: - Main tests
    func testThatViewHasOutput() {
        XCTAssertNotNil(viewController.output, "ThemeViewController is nil after configuration")
    }

    func testThatViewHasCorrectOutput() {
        XCTAssertTrue(viewController.output is ThemePresenter, "output is not ThemePresenter")
    }

    func testThatViewOutputCanAssignWithPresenter() {
        guard let _: ThemePresenter = viewController.output as? ThemePresenter else {
            XCTFail("Cannot assign viewController.output as ThemePresenter")
            return
        }
    }

    func testThatPresenterIsNotNil() {
        guard let presenter: ThemePresenter = viewController.output as? ThemePresenter else { return }
        XCTAssertNotNil(presenter.view, "view in ThemePresenter is nil after configuration")
    }
}
