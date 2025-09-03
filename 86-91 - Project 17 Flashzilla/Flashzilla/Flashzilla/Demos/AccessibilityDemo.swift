//
//  AccessibilityDemo.swift
//  Flashzilla
//
//  Created by Alisha Carrington on 03/09/2025.
//

// accessibility settings provided through the Environment

import SwiftUI

// change appearance of UI depending on whether 'Differentiate Without Color' option is turned on in user's settings
struct AccessibilityDemo: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor  // will be true or false
    
    var body: some View {
        HStack {
            if differentiateWithoutColor {
                Image(systemName: "checkmark.circle")
            }
            
            Text("Success")
        }
        .padding()
        .background(differentiateWithoutColor ? .black : .green)
        .foregroundStyle(.white)
        .clipShape(.capsule)
    }
}

// restrict the use of withAnimation() when reduce motion setting is on
struct ReduceMotionAccessibility: View {
    @Environment(\.accessibilityReduceMotion) var reduceMotion  // true or false
    @State private var scale = 1.0
    
    var body: some View {
        Button("Hello, World!") {
            // using UIKit function below
            withOptionalAnimation {
                scale *= 1.5
            }
        }
        .scaleEffect(scale)
    }
    
    // using UIKit's UIAccessibility data directly to bypass animation automatically
    func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
        // when ReduceMotionEnabled is true, the closure passed in is executed immediately
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        } else {
            // otherwise it's passed along using withAnimation()
            return try withAnimation(animation, body)
        }
    }
}

struct ReduceTransparencyAccessibility: View {
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency  // true or false
    
    var body: some View {
        Text("Hello, World!")
            .padding()
            .background(reduceTransparency ? .black : .black.opacity(0.5))
            .foregroundStyle(.white)
            .clipShape(.capsule)
    }
}

#Preview {
    AccessibilityDemo()
}

#Preview {
    ReduceMotionAccessibility()
}

#Preview {
    ReduceTransparencyAccessibility()
}
