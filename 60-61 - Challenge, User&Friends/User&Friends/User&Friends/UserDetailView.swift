//
//  UserDetailView.swift
//  User&Friends
//
//  Created by Alisha Carrington on 09/08/2025.
//

import SwiftUI

struct UserDetailView: View {
    var user: User
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text("Company:").bold()
                    Text(user.company)
                }
                
                HStack {
                    Text("Email:").bold()
                    Text(user.email)
                }
                
                Text("About:").bold()
                Text(user.about)
                
                Text("Registered on \(user.formattedRegisteredDate)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.top, 1)
                    .padding(.bottom)
                
                Text("Friends:").bold()
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            }
        }
        .padding(.horizontal)
        .navigationTitle(user.name)
        .scrollBounceBehavior(.basedOnSize)
        .scrollIndicators(.hidden)
    }
}

//#Preview {
//    let user = User(id: "123", isActive: true, name: "user name", age: 24, company: "company", email: "email", address: "address", about: "about", registered: Date.now, tags: ["tag"], friends: [User.Friend(id: "456", name: "friend name")])
//    UserDetailView(user: user)
//}
