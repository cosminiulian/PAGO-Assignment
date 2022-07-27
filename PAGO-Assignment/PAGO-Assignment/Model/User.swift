//
//  User.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

struct User: Decodable {
    
    let id: Int
    let name: String
    let email: String
    let gender: String
    let status: String
}
