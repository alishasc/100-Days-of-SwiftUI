//
//  ContentView.swift
//  User&Friends
//
//  Created by Alisha Carrington on 09/08/2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) var users: [User]
    @State private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(users) { user in
                    NavigationLink {
                        UserDetailView(user: user)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(user.name)
                            Text(user.isActive ? "Active" : "Inactive")
                                .font(.subheadline)
                                .foregroundStyle(user.isActive ? .green : .secondary)
                        }
                    }
                }
            }
            .task {
                // load data if haven't done so already
                if users.isEmpty {
                    await viewModel.fetchData()
                    for user in viewModel.users {
                        modelContext.insert(user)
                    }
                }
            }
            .navigationTitle("Users")
        }
    }
}

#Preview {
    ContentView()
}
