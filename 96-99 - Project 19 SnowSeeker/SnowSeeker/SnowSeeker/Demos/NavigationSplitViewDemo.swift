//
//  NavigationSplitViewDemo.swift
//  SnowSeeker
//
//  Created by Alisha Carrington on 16/09/2025.
//

import SwiftUI

struct NavigationSplitViewDemo: View {
    var body: some View {
        NavigationSplitView(/*columnVisibility: .constant(.all)*/ preferredCompactColumn: .constant(.detail)) {
            NavigationLink("Primary") {
                Text("New View")
            }
        } detail: {
            Text("Content")
                .navigationTitle("Content View")
        }
        .navigationSplitViewStyle(.balanced)
        .toolbar(.hidden, for: .navigationBar)  // hide toolbar in the detail view
    }
}

#Preview {
    NavigationSplitViewDemo()
}
