//
//  Networking.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

import Foundation

final class Networking: NetworkingProtocol {
    
    private let session = Session.shared
    
    func getUsers(completion: @escaping GetUsersCompletion) {
        let headers = ["Accept": "application/json"]
        
        session.request(httpMethod: .get,
                        urlString: URLs.getUsers,
                        headers: headers,
                        completion: completion)
    }
}
