//
//  ContactsController+Protocol.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

import UIKit

extension ContactsViewController: ViewControllerProtocol {
    
    func setupSubviews() {
        view.addSubview(headerView)
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        headerView.anchor(
            top: view.topAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            heightConstant: 130)
        
        tableView.anchor(
            top: headerView.bottomAnchor,
            left: view.leftAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            right: view.rightAnchor)
    }
    
    func setupSubscribers() {
        postsSubscriber = viewModel.$usersResult
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] usersResult in
                if let users = usersResult {
                    self.users = users
                    self.activeUsers = self.getActiveUsers(from: users)
                    self.tableView.reloadData()
                }
            }
        
        errorSubscriber = viewModel.$errorMessage
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] errorMessage in
                if let message = errorMessage {
                    self.displayAlert(message: message)
                }
            }
    }
    
    func setupButtonsAction() {
        headerView.addActionForButton(self, action: #selector(addContactAction))
    }
    
}
