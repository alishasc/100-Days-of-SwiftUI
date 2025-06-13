//
//  ContentView.swift
//  ShowAlertMessages
//
//  Created by Alisha Carrington on 26/10/2024.
//

import SwiftUI

struct ContentView: View {
    // track whether the alert should be showing or not
    @State private var showingAlert1 = false
    @State private var showingAlert2 = false
    @State private var showingAlert3 = false
    
    var body: some View {
        VStack(spacing: 20) {
            // title and one button
            Button("Show Alert 1") {
                showingAlert1 = true
            }
            // saying alert exists and is shown when showingAlert is true
            .alert("Important message", isPresented: $showingAlert1) {
                // aren't assigning any functionality to the Button when pressed
                Button("OK") { }
            }
            
            // title and two buttons
            Button("Show Alert 2") {
                showingAlert2 = true
            }
            // roles make it clear what each button does
            .alert("Important message", isPresented: $showingAlert2) {
                Button("Delete", role: .destructive) { }
                Button("Cancel", role: .cancel) { }
            }
            
            // title, message and one button
            Button("Show Alert 3") {
                showingAlert3 = true
            }
            .alert("Important message", isPresented: $showingAlert3) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Please read this.")
            }
        }
    }
}

#Preview {
    ContentView()
}

