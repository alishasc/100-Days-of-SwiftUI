//
//  ComparableUserDemo.swift
//  BucketList
//
//  Created by Alisha Carrington on 15/08/2025.
//

import SwiftUI

struct ComparableUserDemo: View {
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Kristine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "Lister")
    ].sorted()  // now sorts array by lastName
    
    var body: some View {
        List(users) { user in
            Text("\(user.firstName) \(user.lastName)")
        }
    }
}

#Preview {
    ComparableUserDemo()
}

// make our own data types (User) conform to Comparable
struct User: Identifiable, Comparable {
    let id = UUID()
    var firstName: String
    var lastName: String
    
    // the method is just called < - the job of the method
    static func <(lhs: User, rhs: User) -> Bool {
        // returns true if the first user should be sorted before the second
        lhs.lastName < rhs.lastName
    }
}
