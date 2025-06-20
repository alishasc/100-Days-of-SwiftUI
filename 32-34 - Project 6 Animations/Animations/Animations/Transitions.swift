//
//  Transitions.swift
//  Animations
//
//  Created by Alisha Carrington on 12/06/2025.
//

import SwiftUI

struct Transitions: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .animation(.default, value: enabled)  // only affects colour change
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        .animation(.spring(duration: 1, bounce: 0.6), value: enabled)  // only affects shape change
    }
}

#Preview {
    Transitions()
}
