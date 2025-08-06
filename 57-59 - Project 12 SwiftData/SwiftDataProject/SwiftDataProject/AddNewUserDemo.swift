//
//  AddNewUserDemo.swift
//  SwiftDataProject
//
//  Created by Alisha Carrington on 06/08/2025.
//

import SwiftData
import SwiftUI

struct AddNewUserDemo: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) var users: [User]
    @State private var path = [User]()
    
    var body: some View {
        NavigationStack(path: $path) {
            List(users) { user in
                NavigationLink(value: user) {
                    Text(user.name)
                }
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                EditUserView(user: user)
            }
            .toolbar {
                Button("Add User", systemImage: "plus") {
                    // create new user object with empty properties
                    let user = User(name: "", city: "", joinDate: .now)
                    // add the data to the model
                    modelContext.insert(user)
                    // then navigate to that user info using the path property
                    path = [user]
                }
            }
        }
    }
}

#Preview {
    AddNewUserDemo()
}
