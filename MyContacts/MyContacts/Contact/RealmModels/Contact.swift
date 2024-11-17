//
//  Contact.swift
//  MyContacts
//
//  Created by Mantosh Kumar on 17/11/24.
//

import UIKit
import RealmSwift

class Contact: Object {
    @objc dynamic var id = UUID()
    @objc dynamic var firstName: String?
    @objc dynamic var lastName: String?
    @objc dynamic var contactNumber: String?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(id: UUID = UUID(), firstName: String? = nil, lastName: String? = nil, contactNumber: String? = nil) {
        self.init()
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.contactNumber = contactNumber
    }
    
    
    
}




