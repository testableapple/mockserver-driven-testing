//
//  NativeMockServerUITests.swift
//  NativeMockServerUITests
//

import XCTest

final class NativeMockServerUITests: XCTestCase {
    
    private var server = NativeMockServer()
    private var app = XCUIApplication()

    override func setUpWithError() throws {
        server.start()
        app.launchArguments = ["MOCK_SERVER"]
        app.launch()
    }

    override func tearDownWithError() throws {
        server.stop()
        app.launchArguments.removeAll()
    }
    
    func testUsername() throws {
        let expectedUsername = "Frodo"
        server.mockUsername(expectedUsername)
        
        app.images["gamecontroller"].coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 0.0)).tap()
        let actualUsername = app.staticTexts["username"].label
        
        XCTAssertEqual(expectedUsername, actualUsername)
    }
}
