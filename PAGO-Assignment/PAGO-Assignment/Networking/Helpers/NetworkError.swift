//
//  NetworkError.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

import Foundation

enum NetworkError: Error {
    
    case invalidURL
    case existingError(description: String)
    case invalidResponse(statusCode: Int)
    case invalidData
    case failedToDecode
    case failedToMock
}

extension NetworkError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("The URL from request is not valid.",
                                     comment: "Invalid URL")
            
        case .existingError(description: let errorDescription):
            return NSLocalizedString(errorDescription,
                                     comment: "Existing Error")
            
        case .invalidResponse(statusCode: let statusCode):
            return NSLocalizedString("The response from request is not valid.\nStatus Code: \(statusCode).",
                                     comment: "Invalid Response")
            
        case .invalidData:
            return NSLocalizedString("The data from request is not valid.",
                                     comment: "Invalid Data")
            
        case .failedToDecode:
            return NSLocalizedString("Failed to decode the data received from request.",
                                     comment: "Failed to decode")
            
        case .failedToMock:
            return NSLocalizedString("Failed to mock the request.",
                                     comment: "Failed to mock")
        }
    }
}

