//
//  HTTPMethod.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

public struct HTTPMethod: RawRepresentable, Equatable, Hashable {
    /// `GET` method.
    public static let get = HTTPMethod(rawValue: "GET")
    /// `POST` method.
    public static let post = HTTPMethod(rawValue: "POST")
    /// `PUT` method.
    public static let put = HTTPMethod(rawValue: "PUT")
    /// `DELETE` method.
    public static let delete = HTTPMethod(rawValue: "DELETE")
    /// `HEAD` method.
    public static let head = HTTPMethod(rawValue: "HEAD")
    /// `PATCH` method.
    public static let patch = HTTPMethod(rawValue: "PATCH")
    
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}
