//
//  StringExtension.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

import Foundation

extension String {
    
    /// Get initials from name
    func getInitials() -> String {
        return self.components(separatedBy: " ").reduce("") {
            ($0.isEmpty ? "" : "\($0.first!)") + "\($1.first!)"
        }
    }
    
    // VALIDATORS
    
    func isValid() -> Bool {
        return replacingOccurrences(of: " ", with: "").count > 0
    }
    
    public func isEmailValid() -> Bool {
        let emailPattern = #"^\S+@\S+\.\S+$"#
        return NSPredicate(format: "SELF MATCHES %@", emailPattern).evaluate(with: self)
    }
    
    public func isPhoneNrValid() -> Bool {
        let phonePattern = #"^\(?\d{3}\)?[ -]?\d{3}[ -]?\d{4}$"#
        return NSPredicate(format: "SELF MATCHES %@", phonePattern).evaluate(with: self)
    }
}
