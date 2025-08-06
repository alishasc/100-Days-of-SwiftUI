//
//  User.swift
//  SwiftDataProject
//
//  Created by Alisha Carrington on 06/08/2025.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String
    var city: String
    var joinDate: Date
    @Relationship(deleteRule: .cascade) var jobs = [Job]()  // deleting a User will delete their Jobs too
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
