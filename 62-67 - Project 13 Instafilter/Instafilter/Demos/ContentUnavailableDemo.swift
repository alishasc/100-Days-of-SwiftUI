//
//  ContentUnavailableDemo.swift
//  Instafilter
//
//  Created by Alisha Carrington on 12/08/2025.
//

import SwiftUI

struct ContentUnavailableDemo: View {
    var body: some View {
//        ContentUnavailableView("No snippets", systemImage: "swift", description: Text("You don't have any saved snippets yet."))
        
        ContentUnavailableView {
            Label("No snippets", systemImage: "swift")
        } description: {
            Text("You don't have any saved snippets yet.")
        } actions: {
            Button("Create Snippet") {
                //
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ContentUnavailableDemo()
}
