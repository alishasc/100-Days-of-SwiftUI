//
//  ContentView.swift
//  ViewsAsProperties
//
//  Created by Alisha Carrington on 28/10/2024.
//

import SwiftUI

struct ContentView: View {
    // computed property for motto1 - good way to carve up complex views into smaller chunks. but Swift won't automatically apply the @ViewBuilder attribute
    // used instead of view property at top
    var motto1: some View {
        Text("Draco dormiens")
    }
    
    let motto2 = Text("nunquam titillandus")
    
    var body: some View {
        // using the properties containing views
        VStack {
            // motto1 defined in separate computed property at top
            motto1
                .foregroundStyle(.red)
            // defined as ordinary view property
            motto2
                .foregroundStyle(.blue)
        }
    }
    
//        var spells: some View {
//            // Group = the arrangement of the views is determined by how you use them elsewhere in the code
//            Group {
//                Text("Lumos")
//                Text("Obliviate")
//            }
//        }
    
    // adding @ViewBuilder makes it mimic the way the body works
    @ViewBuilder var spells: some View {
        Text("Lumos")
        Text("Obliviate")
    }
}

#Preview {
    ContentView()
}
