//
//  ContactsTests.swift
//  PAGO-AssignmentTests
//
//  Created by Cosmin Iulian on 26.07.2022.
//

import XCTest
@testable import PAGO_Assignment

final class ContactsTests: XCTestCase {
    
    var viewModel: ContactsViewModel!
    var mockSession: MockNetworking!
    
    override func setUp() {
        mockSession = .init()
        viewModel = .init(session: mockSession)
    }
    
    func testGetUsersRequestWithOKResponseShouldReturnUsersResult() {
        mockSession.filename = JSONFilename.getUsersOKResponse
        viewModel.getUsersRequest()
        XCTAssertNotNil(viewModel.usersResult)
    }
    
    func testGetUsersRequestWithInvalidResponseShouldReturnErrorMessage() {
        mockSession.filename = JSONFilename.getUsersInvalidResponse
        viewModel.getUsersRequest()
        XCTAssertNotNil(viewModel.errorMessage)
    }
    
}
