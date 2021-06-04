//
//  ContactBookUITests.swift
//  ContactBookUITests
//
//  Created by Aries Yang on 2021/6/4.
//

import XCTest

class ContactBookUITests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
    }

    func testEmptyState() throws {
        let app = XCUIApplication()
        app.launch()

        let emptyLabel = app.staticTexts["Tap + button to add contacts."]
        XCTAssertTrue(emptyLabel.exists)
    }

    func testRightBarButtonItem() {
        let app = XCUIApplication()
        app.launch()

        let addButton = app.navigationBars.buttons["rightBarButtonItem_addButton"]
        XCTAssertTrue(addButton.exists)
    }
}
