//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Alisha Carrington on 27/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Button("Hello, world!") {
                print(type(of: self.body))
            }
            .frame(width: 200, height: 200)
            .background(.red)
            
            Text("Hello, world!")
                .padding()
                .background(.red)
                .padding()
                .background(.blue)
                .padding()
                .background(.green)
                .padding()
                .background(.yellow)
            
            Button("Hello, world!") {
                // flip the Boolean value between true and false when pressed
                useRedText.toggle()
            }
            // ternary operator to switch colors
            .foregroundStyle(useRedText ? .red : .blue)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.orange)
        
        VStack {
            Text("Gryffindor")
                .font(.largeTitle)  // overrides environment modifier
            Text("HufflePuff")
            Text("RavenClaw")
            Text("Slytherin")
        }
        .font(.title)  // environment modifier
    }
}

#Preview {
    ContentView()
}
