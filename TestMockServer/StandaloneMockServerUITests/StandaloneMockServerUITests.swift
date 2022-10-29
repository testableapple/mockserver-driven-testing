//
//  StandaloneMockServerUITests.swift
//  StandaloneMockServerUITests
//

import XCTest

final class StandaloneMockServerUITests: XCTestCase {
    
    private var app = XCUIApplication()
    private var server = StandaloneMockServer()

    override func setUp() {
        
        app.launchArguments = ["MOCK_SERVER"]
        app.launch()
    }
    
    func testUsername() {
        let expectedUsername = "Samwise"
        server.mockUsername(expectedUsername)
        
        app.images["gamecontroller"].coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 0.0)).tap()
        
        let actualUsername = app.staticTexts["username"].label
        
        XCTAssertEqual(expectedUsername, actualUsername)
    }
    
    override func tearDown() {
        
        app.launchArguments.removeAll()
    }
}
