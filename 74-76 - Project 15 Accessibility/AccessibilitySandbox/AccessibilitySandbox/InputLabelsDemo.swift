//
//  accessibilityInputLabelsDemo.swift
//  AccessibilitySandbox
//
//  Created by Alisha Carrington on 18/08/2025.
//

import SwiftUI

struct accessibilityInputLabelsDemo: View {
    var body: some View {
        Button("John Fitzgerald Kennedy") {
            print("Button tapped")
        }
        // so can say to 'Tap JFK' instead of 'Tap John Fitzgerald Kennedy' if wanted
        .accessibilityInputLabels(["John Fitzgerald Kennedy", "Kennedy", "JFK"])
    }
}

#Preview {
    accessibilityInputLabelsDemo()
}
