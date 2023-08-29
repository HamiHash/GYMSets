//
//  workoutDays.swift
//  GYMSets
//
//  Created by Hamed Hashemi on 8/29/23.
//

import Foundation
import RealmSwift

class Days: Object {
    @objc dynamic var day: String
    let Sets
    
    init(day: String) {
        self.day = day
    }
}
