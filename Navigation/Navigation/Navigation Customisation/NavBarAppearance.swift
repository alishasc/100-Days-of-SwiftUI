//
//  NavBarAppearance.swift
//  Navigation
//
//  Created by Alisha Carrington on 01/07/2025.
//

import SwiftUI

struct NavBarAppearance: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline)
//            .toolbar(.hidden, for: .navigationBar)  // can cause UI problems!
            // see these modifiers when scrolling
            .toolbarBackground(.blue, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

#Preview {
    NavBarAppearance()
}
