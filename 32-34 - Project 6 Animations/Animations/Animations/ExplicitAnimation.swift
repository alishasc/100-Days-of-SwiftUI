//
//  ExplicitAnimation.swift
//  Animations
//
//  Created by Alisha Carrington on 12/06/2025.
//

import SwiftUI

struct ExplicitAnimation: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
            withAnimation(.spring(duration: 1, bounce: 0.5)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

#Preview {
    ExplicitAnimation()
}
