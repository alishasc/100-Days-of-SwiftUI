//
//  ContentView.swift
//  HotProspects
//
//  Created by Alisha Carrington on 21/08/2025.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
        TabView {
            // every person you've met
            ProspectsView(filter: .none)
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            // people you have contacted
            ProspectsView(filter: .contacted)
                .tabItem {
                    Label("Contacted", systemImage: "checkmark.circle")
                }
            // people you haven't contacted
            ProspectsView(filter: .uncontacted)
                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
            MeView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.square")
                }
        }
    }
}

#Preview {
    ContentView()
}
