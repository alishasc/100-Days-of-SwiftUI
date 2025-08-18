//
//  accessibilityAdjustableActionDemo.swift
//  AccessibilitySandbox
//
//  Created by Alisha Carrington on 18/08/2025.
//

import SwiftUI

struct accessibilityAdjustableActionDemo: View {
    @State private var value = 10
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Value: \(value)")
            
            Button("Increment") {
                value += 1
            }
            
            Button("Decrement") {
                value -= 1
            }
        }
        .accessibilityElement() // make views invisible to VoiceOver
        .accessibilityLabel("Value")
        .accessibilityValue(String(value)) // Adds a textual description of the value that the view contains.
        // user can swipe up/down to increase/decrease the value
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                value += 1
            case .decrement:
                value -= 1
            default:
                print("Not handled.")
            }
        }
    }
}

#Preview {
    accessibilityAdjustableActionDemo()
}
