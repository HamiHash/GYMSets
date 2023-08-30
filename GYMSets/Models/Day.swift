//
//  Day.swift
//  GYMSets
//
//  Created by Hamed Hashemi on 8/29/23.
//

import Foundation
import RealmSwift

class Day: Object {
    @objc dynamic var day: String = ""
    let sets = List<Set>()
}
