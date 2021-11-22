//
//  LaunchesModuleConfiguratorTests.swift
//  SpaceXTests
//
//  Created by Ibragim Akaev on 21/11/2021.
//

import XCTest
@testable import SpaceX

final class LaunchesModuleConfiguratorTests: XCTestCase {
    let viewController = LaunchesModuleConfigurator().configure(with: MockNetworkService(),
                                                                and: MockEndpoint(),
                                                                and: MockDataBase())
    let presenter = LaunchesPresenter()

    // MARK: - Main tests
    func testThatViewHasOutput() {
        XCTAssertNotNil(viewController.output, "LaunchesViewController is nil after configuration")
    }

    func testThatViewHasCorrectOutput() {
        XCTAssertTrue(viewController.output is LaunchesPresenter, "output is not LaunchesPresenter")
    }

    func testThatViewOutputCanAssignWithPresenter() {
        guard let _: LaunchesPresenter = viewController.output as? LaunchesPresenter else {
            XCTFail("Cannot assign viewController.output as LaunchesPresenter")
            return
        }
    }

    func testThatPresenterIsNotNil() {
        guard let presenter: LaunchesPresenter = viewController.output as? LaunchesPresenter else { return }
        XCTAssertNotNil(presenter.view, "view in LaunchesPresenter is nil after configuration")
    }

    func testThatRouterIsNotNil() {
        guard let presenter: LaunchesPresenter = viewController.output as? LaunchesPresenter else { return }
        XCTAssertNotNil(presenter.router, "router in LaunchesPresenter is nil after configuration")
    }

    func testThatPresenterHasCorrectRouter() {
        guard let presenter: LaunchesPresenter = viewController.output as? LaunchesPresenter else { return }
        XCTAssertTrue(presenter.router is LaunchesRouter, "router is not LaunchesRouter")
    }

    func testThatPresenterConformCorrectRouter() {
        guard let presenter: LaunchesPresenter = viewController.output as? LaunchesPresenter else { return }
        guard let _: LaunchesRouter = presenter.router as? LaunchesRouter else {
            XCTFail("Cannot assign presenter.router as LaunchesRouter")
            return
        }
    }

    func testThatViewHasCorrectRouter() {
        guard let router: LaunchesRouter = presenter.router as? LaunchesRouter else { return }
        XCTAssertTrue(router.view is LaunchesViewController, "view in router is not LaunchesViewController")
    }
}

extension LaunchesModuleConfiguratorTests {
    private final class MockNetworkService: LaunchesNetworkServiceProtocol {
        func loadLaunches(_ endpoint: EndpointProtocol, completion: @escaping (LoadLaunchesResponse) -> Void) {
            fatalError()
        }

        func loadImage(from url: URL, completion: @escaping (LoadImageResponse) -> Void) {
            fatalError()
        }
    }

    private final class MockDataBase: DataBaseServiceProtocol {
        func update(launches: [Launch]) {
            fatalError()
        }

        func launches() -> [Launch] {
            fatalError()
        }

        func delete(launches: [Launch]?) {
            fatalError()
        }
    }

    private final class MockEndpoint: EndpointProtocol {
        static func launches() -> Endpoint {
            fatalError()
        }

        var url: URL? { return nil }
    }
}
