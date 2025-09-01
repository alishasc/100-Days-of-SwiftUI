//
//  ListSelectionsDemo.swift
//  HotProspects
//
//  Created by Alisha Carrington on 25/08/2025.
//

import SwiftUI

struct ListSelectionsDemo: View {
    var users = ["Tohru", "Yuki", "Kyo", "Momiji"]
    
//    @State private var selection: String?  // select one option
    @State private var selection = Set<String>()  // select multiple
    
    var body: some View {
        EditButton()  // enable multi-select
        
        List(users, id: \.self, selection: $selection) { user in
            Text(user)
        }
        
        if selection.isEmpty == false {
            // formatted - display names as a single String
            Text("You selected \(selection.formatted())")
        }
    }
}

#Preview {
    ListSelectionsDemo()
}
