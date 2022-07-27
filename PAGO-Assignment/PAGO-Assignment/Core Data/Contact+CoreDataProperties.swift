//
//  Contact+CoreDataProperties.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//
//

import Foundation
import CoreData

extension Contact {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }
    
    @NSManaged public var id: UUID!
    @NSManaged public var phone: String?
    @NSManaged public var email: String?
    @NSManaged public var firstName: String!
    @NSManaged public var lastName: String!
}

extension Contact : Identifiable { }
