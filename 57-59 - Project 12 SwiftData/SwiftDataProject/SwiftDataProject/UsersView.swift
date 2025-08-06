//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Alisha Carrington on 06/08/2025.
//

// list of user results - used with DynamicSortingQueryDemo.swift

import SwiftData
import SwiftUI

struct UsersView: View {
    @Query var users: [User]
    
    // example 1
//    init(minimumJoinDate: Date) {
//        // the underscore is Swift's way of getting access to that Query
//        _users = Query(filter: #Predicate<User> { user in
//            user.joinDate >= minimumJoinDate
//        }, sort: \User.name)
//    }
    
    // example 2
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
    
    var body: some View {
        List(users) { user in
            Text(user.name)
        }
    }
}

#Preview {
    UsersView(minimumJoinDate: Date.now, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
