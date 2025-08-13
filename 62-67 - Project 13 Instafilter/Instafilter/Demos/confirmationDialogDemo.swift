//
//  confirmationDialogDemo.swift
//  Instafilter
//
//  Created by Alisha Carrington on 12/08/2025.
//

import SwiftUI

struct confirmationDialogDemo: View {
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        Button("Hello, World!") {
            showingConfirmation = true
        }
        .frame(width: 300, height: 300)
        .background(backgroundColor)
        .confirmationDialog("Change background", isPresented: $showingConfirmation) {
            Button("Red") { backgroundColor = .red }
            Button("Green") { backgroundColor = .green }
            Button("Yellow") { backgroundColor = .yellow }
            Button("Cancel", role: .cancel) { }
        } message: {
            // title on the confirmationDialog when presented
            Text("Select a new color")
        }
    }
}

#Preview {
    confirmationDialogDemo()
}
