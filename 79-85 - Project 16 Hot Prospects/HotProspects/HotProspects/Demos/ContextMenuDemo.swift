//
//  ContextMenuDemo.swift
//  HotProspects
//
//  Created by Alisha Carrington on 25/08/2025.
//

import SwiftUI

struct ContextMenuDemo: View {
    @State private var backgroundColor = Color.red
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
                .background(backgroundColor)
            
            Text("Change Color")
                .padding()
                .contextMenu {
                    Button("Red", systemImage: backgroundColor == .red ? "checkmark.circle.fill" : "") {
                        backgroundColor = .red
                    }
                    
                    Button("Green", systemImage: backgroundColor == .green ? "checkmark.circle.fill" : "") {
                        backgroundColor = .green
                    }
                    
                    Button("Blue", systemImage: backgroundColor == .blue ? "checkmark.circle.fill" : "") {
                        backgroundColor = .blue
                    }
                }
        }
    }
}

#Preview {
    ContextMenuDemo()
}
