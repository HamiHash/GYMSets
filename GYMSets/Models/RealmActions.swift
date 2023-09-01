//
//  RealmActions.swift
//  GYMSets
//
//  Created by Hamed Hashemi on 8/29/23.
//
import Foundation
import RealmSwift

class RealmActions {
    
    let realm = try! Realm()
    
    /// Using genetics here so we can add both 'Day' and 'Set' types. We also have to set the <T : Object>  so it follow the Realm Object protocol.
    func add<T: Object>(_ item: T) {
        do {
            try realm.write {
                realm.add(item)
            }
        } catch {
            print("Error while saving item: \(error)")
        }
    }
    
    func loadDays() -> Results<Day> {
        return realm.objects(Day.self)
    }
    
    func loadSets() -> Results<Set> {
        return realm.objects(Set.self)
    }
    
    func delete(_ item: Day) {
        do {
            try realm.write {
                realm.delete(item)
            }
        } catch {
            print("Error while deleting item: \(error)")
        }
    }
    
}
