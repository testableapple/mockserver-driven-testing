//
//  StandaloneMockServerUITests.swift
//  StandaloneMockServerUITests
//

import XCTest

final class StandaloneMockServerUITests: XCTestCase {
    
    private var server = StandaloneMockServer()
    private var app = XCUIApplication()

    override func setUpWithError() throws {
        
        app.launchArguments = ["MOCK_SERVER"]
        app.launch()
    }
    
    override func tearDownWithError() throws {
        
        app.launchArguments.removeAll()
    }
    
    func testUsername() throws {
        let expectedUsername = "Samwise"
        server.mockUsername(expectedUsername)
        
        app.images["gamecontroller"].coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 0.0)).tap()
        let actualUsername = app.staticTexts["username"].label
        
        XCTAssertEqual(expectedUsername, actualUsername)
    }
}
