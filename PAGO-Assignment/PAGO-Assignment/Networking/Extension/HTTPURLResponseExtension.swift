//
//  HTTPURLResponseExtension.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

import Foundation

extension HTTPURLResponse {
    /// Returns `true` if `statusCode` is in range 200...299.
    /// Otherwise `false`.
    var isSuccessful: Bool {
        return 200 ... 299 ~= statusCode
    }
}
