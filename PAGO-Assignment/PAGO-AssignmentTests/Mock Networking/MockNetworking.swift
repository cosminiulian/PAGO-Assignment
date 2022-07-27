//
//  MockNetworking.swift
//  PAGO-AssignmentTests
//
//  Created by Cosmin Iulian on 26.07.2022.
//

import XCTest
@testable import PAGO_Assignment

final class MockNetworking: NetworkingProtocol {
    
    private let session = MockSession.shared
    var filename: String?
    
    func getUsers(completion: @escaping GetUsersCompletion) {
        if let filename = filename {
            session.mock(filename: filename, completion: completion)
        }
    }
    
}
