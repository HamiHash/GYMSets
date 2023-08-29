//
//  RealmActions.swift
//  GYMSets
//
//  Created by Hamed Hashemi on 8/29/23.
//

import Foundation
import RealmSwift

extension TableViewController {
    
    func add(_ item: Day) {
        do {
            try realm.write {
                realm.add(item)
                tableView.reloadData() // refreshing the tableView
            }
        } catch {
            print("Error while saving newItem: \(error)")
        }
    }
    
    func loadData() {
        workoutDays = realm.objects(Day.self)
        tableView.reloadData()
    }
}
