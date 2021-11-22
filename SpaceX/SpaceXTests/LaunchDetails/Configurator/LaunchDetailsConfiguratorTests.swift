//
//  LaunchDetailsConfiguratorTests.swift
//  SpaceXTests
//
//  Created by Ibragim Akaev on 21/11/2021.
//

import XCTest
@testable import SpaceX

final class LaunchDetailsConfiguratorTests: XCTestCase {
    let viewController = LaunchDetailsModuleConfigurator().configure(with: mockLaunch(), service: MockNetworkService())
    let presenter = LaunchDetailsPresenter()

    // MARK: - Main tests
    func testThatViewHasOutput() {
        XCTAssertNotNil(viewController.output, "LaunchDetailsViewController is nil after configuration")
    }

    func testThatViewHasCorrectOutput() {
        XCTAssertTrue(viewController.output is LaunchDetailsPresenter, "output is not LaunchDetailsPresenter")
    }

    func testThatViewOutputCanAssignWithPresenter() {
        guard let _: LaunchDetailsPresenter = viewController.output as? LaunchDetailsPresenter else {
            XCTFail("Cannot assign viewController.output as LaunchDetailsPresenter")
            return
        }
    }

    func testThatPresenterIsNotNil() {
        guard let presenter: LaunchDetailsPresenter = viewController.output as? LaunchDetailsPresenter else { return }
        XCTAssertNotNil(presenter.view, "view in LaunchDetailsPresenter is nil after configuration")
    }

    func testThatRouterIsNotNil() {
        guard let presenter: LaunchDetailsPresenter = viewController.output as? LaunchDetailsPresenter else { return }
        XCTAssertNotNil(presenter.router, "router in LaunchDetailsPresenter is nil after configuration")
    }

    func testThatPresenterHasCorrectRouter() {
        guard let presenter: LaunchDetailsPresenter = viewController.output as? LaunchDetailsPresenter else { return }
        XCTAssertTrue(presenter.router is LaunchDetailsRouter, "router is not LaunchDetailsRouter")
    }

    func testThatPresenterConformCorrectRouter() {
        guard let presenter: LaunchDetailsPresenter = viewController.output as? LaunchDetailsPresenter else { return }
        guard let _: LaunchDetailsRouter = presenter.router as? LaunchDetailsRouter else {
            XCTFail("Cannot assign presenter.router as LaunchDetailsRouter")
            return
        }
    }

    func testThatViewHasCorrectRouter() {
        guard let router: LaunchDetailsRouter = presenter.router as? LaunchDetailsRouter else { return }
        XCTAssertTrue(router.view is LaunchDetailsViewController, "view in router is not LaunchDetailsViewController")
    }
}

extension LaunchDetailsConfiguratorTests {
    private final class MockNetworkService: LaunchesNetworkServiceProtocol {
        func loadLaunches(_ endpoint: EndpointProtocol, completion: @escaping (LoadLaunchesResponse) -> Void) {
            fatalError()
        }

        func loadImage(from url: URL, completion: @escaping (LoadImageResponse) -> Void) {
            fatalError()
        }
    }

    static func mockLaunch() -> Launch {
        let launch = Launch(
            links: Links(patch: Patch(small: "Foo"), flickr: Flickr(original: ["Bar"]),
                         article: "Baz", wikipedia: "Foo"), rocket: "Bar", success: true,
            details: nil, launchpad: "Baz", name: "Foo", dateLocal: "Bar", upcoming: true
        )

        return launch
    }
}
