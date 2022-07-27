//
//  ContactsUITests.swift
//  PAGO-AssignmentUITests
//
//  Created by Cosmin Iulian on 26.07.2022.
//

import XCTest

final class ContactsUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
    }
    
    func testTapCell() throws {
        let secondCell = app.tables.cells.element(boundBy: 1)
        // wait 10 sec, then check if cell exists
        XCTAssert(secondCell.waitForExistence(timeout: 10))
        // tap the second cell in the table view
        secondCell.tap()
    }
}
