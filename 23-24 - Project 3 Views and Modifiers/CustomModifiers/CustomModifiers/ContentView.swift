//
//  ContentView.swift
//  CustomModifiers
//
//  Created by Alisha Carrington on 28/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello world")
        // applies custom Title modifier created below
//            .modifier(Title())
        // extension View lets us use the custom modifier like this
            .TitleStyle()
            .watermarked(wtih: "Alisha")
        
        Color.blue
            .frame(width: 300, height: 200)
            .watermarked(wtih: "Hacking with Swift")
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View {
    func TitleStyle() -> some View {
        modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(wtih text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

#Preview {
    ContentView()
}
