//
//  ContactsController+Action.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

import Foundation

extension ContactsViewController {
    
    @objc func addContactAction() {
        navigationController?.pushViewController(ContactDetailsViewController(), animated: true)
    }
}
