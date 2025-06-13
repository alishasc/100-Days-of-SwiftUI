//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Alisha Carrington on 26/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        ZStack {
//            VStack(spacing: 0) {
//                Color.red
//                Color.blue
//            }
//            
////            Color(red: 1, green: 0.8, blue: 0)
//            Text("Your content")
//                .foregroundStyle(.secondary)
//                .padding(50)
//                .background(.ultraThinMaterial)
//        }
        
        // GRADIENTS
//        LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
        
        // let you specify color and how far along the gradient it should be used
//        LinearGradient(stops: [
//            // white from the start to up to 45% of available space
//            Gradient.Stop(color: .white, location: 0.45),
//            // black from 55% of the space onwards
//            Gradient.Stop(color: .black, location: 0.55)
//        ], startPoint: .top, endPoint: .bottom)
        
//        RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
        
//        AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
        
        Text("Your content")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(.white)
            // creates gentle linear gradient in one color
            .background(.green.gradient)
        
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
