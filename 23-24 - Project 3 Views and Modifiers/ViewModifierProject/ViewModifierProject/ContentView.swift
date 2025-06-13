//
//  ContentView.swift
//  ViewModifierProject
//
//  Created by Alisha Carrington on 28/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .BlueTitleStyle()
    }
}

// create our own custom modifier
struct BlueTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle).bold()
            .foregroundStyle(.blue)
    }
}

extension View {
    func BlueTitleStyle() -> some View {
        modifier(BlueTitle())
    }
}

#Preview {
    ContentView()
}
