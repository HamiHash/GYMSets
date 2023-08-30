//
//  RealmActions.swift
//  GYMSets
//
//  Created by Hamed Hashemi on 8/29/23.
//

extension TableViewController {
    
    func add(_ item: Day) {
        do {
            try realm.write {
                realm.add(item)
                tableView.reloadData()
            }
        } catch {
            print("Error while saving item: \(error)")
        }
    }
    
    func loadData() {
        workoutDays = realm.objects(Day.self)
        tableView.reloadData()
    }
    
    func delete(_ item: Day) {
        do {
            try realm.write {
                realm.delete(item)
                tableView.reloadData()
            }
        } catch {
            print("Error while deleting item: \(error)")
        }
    }
    
}
