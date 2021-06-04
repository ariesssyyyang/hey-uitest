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

        addButton.tap()

        let title = app.staticTexts["Add a contact"]
        let description = app.staticTexts["Please enter the information."]
        let nameField = app.textFields["Name"]
        let phoneField = app.textFields["Phone number"]
        let done = app.buttons["Done"]
        XCTAssertTrue(title.exists)
        XCTAssertTrue(description.exists)
        XCTAssertTrue(nameField.exists)
        XCTAssertTrue(phoneField.exists)
        XCTAssertTrue(done.exists)
    }
}
