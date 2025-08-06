//
//  Job.swift
//  SwiftDataProject
//
//  Created by Alisha Carrington on 06/08/2025.
//

import Foundation
import SwiftData

@Model
class Job {
    var name: String
    var priority: Int
    var owner: User?  // linked to the User model
    
    init(name: String, priority: Int, owner: User? = nil) {
        self.name = name
        self.priority = priority
        self.owner = owner
    }
}
