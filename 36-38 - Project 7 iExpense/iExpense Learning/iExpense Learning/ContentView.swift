//
//  ContentView.swift
//  iExpense Learning
//
//  Created by Alisha Carrington on 24/06/2025.
//

import SwiftUI
import Observation

struct ContentView: View {
    @State private var user = User()
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
            
            Button("Show Sheet") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                // instance of SecondView
                SecondView(name: "Alisha")
            }
        }
        .padding()
    }
}

@Observable  // allow changes to be watched and reflected in UI
class User {
    // with default values
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    
    var body: some View {
        Text("Hello \(name)!")
        
        Button("Dismiss") {
            dismiss()
        }
    }
}

#Preview {
    ContentView()
}
