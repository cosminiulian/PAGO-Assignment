//
//  CoreDataManager.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

import Foundation
import CoreData

struct CoreDataManager {
    
    static let shared = CoreDataManager(modelName: "PAGO-Assignment")
    
    private let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init(modelName: String) {
        persistentContainer = NSPersistentContainer(name: modelName)
    }
    
    func load(completion: (() -> Void)? = nil) {
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError(error.localizedDescription)
            }
            completion?()
        }
    }
    
    func save() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print("An error occurred while saving: \(error.localizedDescription)")
            }
        }
    }
    
}


// MARK: - Helper methods

extension CoreDataManager {
    
    func createContact(lastName: String, firstName: String,
                       phone: String? = nil, email: String? = nil) -> Contact {
        let contact = Contact(context: viewContext)
        contact.id = UUID()
        contact.lastName = lastName
        contact.firstName = firstName
        contact.phone = phone
        contact.email = email
        save()
        return contact
    }
    
    func fetchContacts() -> [Contact] {
        let request: NSFetchRequest<Contact> = Contact.fetchRequest()
        let sortDescriptor = NSSortDescriptor(keyPath: \Contact.lastName,
                                              ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        var contacts: [Contact] = []
        do {
            contacts = try viewContext.fetch(request)
        } catch {
            print("An error occurred while fetching: \(error.localizedDescription)")
        }
        
        return contacts
    }
}
