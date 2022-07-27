//
//  ContactsViewModel.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//


import Combine

final class ContactsViewModel {
    @Published var usersResult: [User]? = nil
    @Published var errorMessage: String? = nil
    
    let session: NetworkingProtocol
    
    init(session: NetworkingProtocol = Networking()) {
        self.session = session
    }
    
    func getUsersRequest() {
        session.getUsers() { [unowned self] result in
            switch result {
            case .success(let users):
                self.usersResult = users
                
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
}
