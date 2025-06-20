//
//  AnimateButton.swift
//  Animations
//
//  Created by Alisha Carrington on 12/06/2025.
//

import SwiftUI

struct AnimateButton: View {
    @State private var animationAmount = 1.0

    var body: some View {
        VStack {
            Button("Tap Me") {
//                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false),  // circle will scale up and fade out
                        value: animationAmount
                    )
            )
            .onAppear {
                animationAmount = 2
            }
        }
        .padding()
    }
}

#Preview {
    AnimateButton()
}
