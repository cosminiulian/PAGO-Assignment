//
//  MockSession.swift
//  PAGO-AssignmentTests
//
//  Created by Cosmin Iulian on 26.07.2022.
//

import XCTest
@testable import PAGO_Assignment

final class MockSession {
    
    private init() {}
    static let shared = MockSession()
    
    typealias Completion<T> = (Result<T, NetworkError>) -> Void
    
    func mock<T: Decodable>(filename: String, completion: @escaping Completion<T>) {
        guard let mockData = BundleHelper.getDataFromJSONFile(filename: filename) else {
            completion(.failure(.failedToMock))
            return
        }
        // Decode data
        do {
            let value = try JSONDecoder().decode(T.self, from: mockData)
            completion(.success(value))
        } catch {
            completion(.failure(.failedToMock))
        }
    }
    
}
