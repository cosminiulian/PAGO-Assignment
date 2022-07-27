//
//  ContactsViewController.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

import UIKit
import Combine

final class ContactsViewController: UIViewController {
    
    let headerView: HeaderView = {
        let view = HeaderView()
        view.setImageForButton(image: UIImage(named: "AddContactImage")!)
        view.setTitle(text: "Contacts")
        return view
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ContactTableViewCell.self,
                           forCellReuseIdentifier: ContactTableViewCell.identifier)
        tableView.backgroundColor = UIColor(named: "BackgroundColor")
        tableView.sectionHeaderTopPadding = 0
        return tableView
    }()
    
    let viewModel = ContactsViewModel()
    var postsSubscriber: AnyCancellable?
    var errorSubscriber: AnyCancellable?
    var users: [User] = []
    var activeUsers: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupSubviews()
        setupConstraints()
        setupSubscribers()
        setupButtonsAction()
        setupDelegates()
        
        viewModel.getUsersRequest()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displaySavedContactsOnConsole()
    }
    
    func getActiveUsers(from users: [User]) -> [User] {
        return users.filter { user in
            return user.status == "active"
        }
    }
    
    func setupDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - Display names of saved contacts using Core Data
    // For testing purposes
    func displaySavedContactsOnConsole() {
        let contacts = CoreDataManager.shared.fetchContacts()
        print("\nCONTACTS SAVED IN CORE DATA:")
        if !contacts.isEmpty {
            for contact in contacts {
                print("{")
                print(" last name: \(contact.lastName!)")
                print(" first name: \(contact.firstName!)")
                print(" phone: \(!contact.phone!.isEmpty ? contact.phone! : "no phone")")
                print(" email: \(!contact.email!.isEmpty ? contact.email! : "no email")")
                print("};")
            }
        } else {
            print("Empty")
        }
    }
    
}
