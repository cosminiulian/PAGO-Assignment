//
//  BundleHelper.swift
//  PAGO-AssignmentTests
//
//  Created by Cosmin Iulian on 26.07.2022.
//

import Foundation

final class BundleHelper {
    
    static func getDataFromJSONFile(filename: String) -> Data? {
        let bundle = Bundle(for: BundleHelper.self)
        
        if let path = bundle.path(forResource: filename, ofType: "json") {
            do {
                return try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            } catch {
                print("Error getting data from JSON file..")
            }
        }
        return nil
    }
}
