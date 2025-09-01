//
//  Prospect.swift
//  HotProspects
//
//  Created by Alisha Carrington on 26/08/2025.
//

import Foundation
import SwiftData

@Model
class Prospect {
    var name: String
    var emailAddress: String
    var isContacted: Bool
    var dateAdded = Date.now
    
    init(name: String, emailAddress: String, isContacted: Bool) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContacted = isContacted
    }
    
    static var example = Prospect(name: "Bob", emailAddress: "bob@email.com", isContacted: false)
}
