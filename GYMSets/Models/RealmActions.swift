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
    
    /// NOT USEFUL HERE BUT GOOD TO KNOW ==> Using genetics here so we can add both 'Day' and 'Set' types. We also have to set the <T : Object>  so it follow the Realm Object protocol.
    func add<T: Object>(_ item: T) {
        do {
            try realm.write {
                realm.add(item)
            }
        } catch {
            print("Error while saving item: \(error)")
        }
    }
    
    func addSet(_ item: Set, _ parent: Day) -> Day {
        let newParent: Day = parent
        do {
            try realm.write {
                newParent.sets.append(item)
            }
        } catch {
            print("Error while saving item: \(error)")
        }
        return newParent
    }
    
    func loadDays() -> Results<Day> {
        return realm.objects(Day.self)
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
