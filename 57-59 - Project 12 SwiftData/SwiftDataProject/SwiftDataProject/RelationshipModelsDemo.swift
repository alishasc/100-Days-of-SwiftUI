//
//  RelationshipModelsDemo.swift
//  SwiftDataProject
//
//  Created by Alisha Carrington on 06/08/2025.
//

import SwiftData
import SwiftUI

struct RelationshipModelsDemo: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                HStack {
                    Text(user.name)
                    
                    Spacer()
                    
                    Text(String(user.jobs.count))
                        .fontWeight(.black)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                }
            }
            .toolbar {
                Button("Add Sample") {
                    // delete existing data
                    try? modelContext.delete(model: User.self)
                    
                    // call function
                    addSample()
                }
            }
        }
    }
    
    func addSample() {
        let user1 = User(name: "Piper Chapman", city: "New York", joinDate: .now)
        let job1 = Job(name: "Organise sock drawer", priority: 3)
        let job2 = Job(name: "Make plans with Alex", priority: 4)
        
        modelContext.insert(user1)
        
        user1.jobs.append(job1)
        user1.jobs.append(job2)
    }
}

#Preview {
    RelationshipModelsDemo()
}
