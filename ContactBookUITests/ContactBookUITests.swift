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

    func testShowInputAlert() {
        let app = XCUIApplication()
        app.launch()

        let addButton = app.navigationBars.buttons["rightBarButtonItem_addButton"]
        addButton.tap()

        let title = app.staticTexts["Add a contact"]
        let description = app.staticTexts["Please enter the information."]
        let nameField = app.textFields["Name"]
        let phoneField = app.textFields["Phone number"]
        let done = app.buttons["Done"]
        let cancel = app.buttons["Cancel"]
        XCTAssertTrue(title.exists)
        XCTAssertTrue(description.exists)
        XCTAssertTrue(nameField.exists)
        XCTAssertTrue(phoneField.exists)
        XCTAssertTrue(done.exists)
        XCTAssertTrue(cancel.exists)
    }

    func testTapDoneButtonWithInputs() {
        let app = XCUIApplication()
        app.launch()

        let addButton = app.navigationBars.buttons["rightBarButtonItem_addButton"]
        addButton.tap()

        let nameField = app.textFields["Name"]
        nameField.tap()
        nameField.typeText("Steve Jobs")

        let phoneField = app.textFields["Phone number"]
        phoneField.tap()
        phoneField.typeText("0912345678")

        let done = app.buttons["Done"]
        done.tap()

        let name = app.staticTexts["👤 Steve Jobs"]
        let phoneNumber = app.staticTexts["📱 0912345678"]
        let emptyLabel = app.staticTexts["Tap + button to add contacts."]
        XCTAssertTrue(name.exists)
        XCTAssertTrue(phoneNumber.exists)
        XCTAssertFalse(emptyLabel.exists)
    }
}
