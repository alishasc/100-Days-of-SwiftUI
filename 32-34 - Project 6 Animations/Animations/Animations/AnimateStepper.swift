//
//  AnimateStepper.swift
//  Animations
//
//  Created by Alisha Carrington on 12/06/2025.
//

import SwiftUI

struct AnimateStepper: View {
    @State private var animationAmount = 1.0

    var body: some View {
        print(animationAmount)
        
        return VStack {
            // increase/decrease animationAmount
            // has an animation effect
//            Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
            Stepper("Scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            // size changes with no animation
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    AnimateStepper()
}
