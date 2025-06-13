//
//  ContentView.swift
//  ButtonsAndImages
//
//  Created by Alisha Carrington on 26/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 15) {
            // role: .destructive adjusts button appearance visually and for screen readers
            Button("Delete selection", role: .destructive, action: executeDelete)
            
            Button("Button 1") { }
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)
            Button("Button 3") { }
                .buttonStyle(.borderedProminent)
                // customize color
                .tint(.yellow)
            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
            
            // custom label using second trailing closure
            Button {
                print("Button was tapped")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.mint)
            }
            
            // pencil button with only Image
            Button {
                print("Edit button was tapped")
            } label: {
                Image(systemName: "pencil")
            }
            
            // pencil button with both Image and Text
            Button("Edit", systemImage: "pencil") {
                print("Edit button was tapped")
            }
            
            // more custom version
            Button {
                print("Edit button was tapped")
            } label: {
                Label("Edit", systemImage: "pencil")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
        }
    }
    
    func executeDelete() {
        print("Now deleting...")
    }
}

#Preview {
    ContentView()
}
