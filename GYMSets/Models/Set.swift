//
//  Set.swift
//  GYMSets
//
//  Created by Hamed Hashemi on 8/29/23.
//

import Foundation
import RealmSwift

class Set: Object {
    @objc dynamic var workout: String = ""
    
    var parentCategory = LinkingObjects(fromType: Day.self, property: "sets")
}
