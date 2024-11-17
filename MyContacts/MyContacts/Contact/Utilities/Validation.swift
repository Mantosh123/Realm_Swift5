//
//  Validation.swift
//  MyContacts
//
//  Created by Mantosh Kumar on 17/11/24.
//

import UIKit

class Validation {
    
    public func validationName(name: String) -> Bool {
        if name.isEmpty {
            return false
        }
        return true
    }
    
    public func validatePhoneNumber(phoneNumber: String) -> Bool {
        if phoneNumber.isEmpty {
            return false
        }
        return true
    }
}
