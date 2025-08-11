//
//  User.swift
//  CodableDemo
//
//  Created by Alisha Carrington on 11/08/2025.
//

import Foundation

struct User: Codable {
    enum CodingKeys: String, CodingKey {
        case firstName = "first"  // "first" is how it's named in the JSON file
        case lastName = "last"
        case age
    }
    
    var firstName: String
    var lastName: String
    var age: Int
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.firstName = try container.decode(String.self, forKey: .firstName)
        self.lastName = try container.decode(String.self, forKey: .lastName)
        // age exists as a string in JSON so decode as that
        let stringAge = try container.decode(String.self, forKey: .age)
        // then convert the string into an int to save it in the age variable
        self.age = Int(stringAge) ?? 0
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.firstName, forKey: .firstName)
        try container.encode(self.lastName, forKey: .lastName)
        // need to write age back as a string - keep existing format in the JSON file
        try container.encode(String(self.age), forKey: .age)
    }
}
