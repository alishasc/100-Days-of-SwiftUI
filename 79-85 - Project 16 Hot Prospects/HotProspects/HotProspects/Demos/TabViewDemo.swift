//
//  TabViewDemo.swift
//  HotProspects
//
//  Created by Alisha Carrington on 25/08/2025.
//

import SwiftUI

struct TabViewDemo: View {
    @State private var selectedTab = "One"  // selected from the tag modifier
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Button("Show Tab 2") {
                selectedTab = "Two"
            }
            .tabItem {
                Label("One", systemImage: "star")
            }
            .tag("One")
            
            Button("Show Tab 1") {
                selectedTab = "One"
            }
            .tabItem {
                Label("Two", systemImage: "circle")
            }
            .tag("Two")
        }
    }
}

#Preview {
    TabViewDemo()
}
