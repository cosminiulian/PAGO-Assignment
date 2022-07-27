//
//  NetworkingProtocol.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

protocol NetworkingProtocol {
    // get users
    typealias GetUsersCompletion = (Result<[User], NetworkError>) -> Void
    func getUsers(completion: @escaping GetUsersCompletion)
}
