//
//  RealmWrapper.swift
//  MyContacts
//
//  Created by Mantosh Kumar on 17/11/24.
//

import UIKit
import RealmSwift

class RealmWrapper {
    
    static var realm: Realm {
        get {
            do  {
                return try Realm()
            } catch {
                print("Could not access database: \(error.localizedDescription)")
            }
            return self.realm
        }
    }
    
    // Create / Save data into realm data base
    func saveObjects(objs: Object) {
        do {
            try RealmWrapper.realm.write {
                RealmWrapper.realm.add(objs)
            }
        } catch {
            debugPrint(" Could not save to database: \(error.localizedDescription)")
        }
    }
    
    // Read data from data base
    func getObjects(objc: Object.Type) -> Results <Object>? {
        return RealmWrapper.realm.objects(objc)
    }
    
    // Update the object
    func updateObjects(objs: Object) {
        
        do {
            try RealmWrapper.realm.write {
                RealmWrapper.realm.add(objs, update: .modified)
            }
        } catch {
            debugPrint("Could not update to database: \(error.localizedDescription)")
        }
    }
    
    // Delete the object form db
    func deleteObject(objs: Object) {
        do {
            try RealmWrapper.realm.write {
                RealmWrapper.realm.delete(objs)
            }
        } catch {
            debugPrint("Could not delete to database: \(error.localizedDescription)")
        }
    }
    
    // Add primary key
    func incrementID() -> Int {
        return RealmWrapper.realm.objects(Object.self).max(ofProperty: "id") ?? 0 + 1
    }
}





