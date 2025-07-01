//
//  EditableNavTitle.swift
//  Navigation
//
//  Created by Alisha Carrington on 01/07/2025.
//

import SwiftUI

struct EditableNavTitle: View {
    @State private var title = "SwiftUI"
    
    var body: some View {
        NavigationStack {
            Text("Hello World!")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    EditableNavTitle()
}

