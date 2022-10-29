//
//  NativeMockServerUITests.swift
//  NativeMockServerUITests
//

import XCTest

final class NativeMockServerUITests: XCTestCase {
    
    private var app = XCUIApplication()
    private var server = NativeMockServer()

    override func setUp() {
        server.start()
        app.launchArguments = ["MOCK_SERVER"]
        app.launch()
    }
    
    func testUsername() {
        let expectedUsername = "Frodo"
        server.mockUsername(expectedUsername)
        
        app.images["gamecontroller"].coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 0.0)).tap()
        
        let actualUsername = app.staticTexts["username"].label
        
        XCTAssertEqual(expectedUsername, actualUsername)
    }
    
    override func tearDown()  {
        server.stop()
        app.launchArguments.removeAll()
    }
}
