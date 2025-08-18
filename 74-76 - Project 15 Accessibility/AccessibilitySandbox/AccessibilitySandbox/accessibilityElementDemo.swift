//
//  accessibilityElementDemo.swift
//  AccessibilitySandbox
//
//  Created by Alisha Carrington on 18/08/2025.
//

import SwiftUI

struct accessibilityElementDemo: View {
    var body: some View {
        Image(decorative: "character")
            .accessibilityHidden(true)
        
        VStack {
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
        .padding(.bottom)
        // both text views will be read together - with a pause
//        .accessibilityElement(children: .combine)
        
        // to read the accessibility label instead without a pause
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Your score is 1000")
    }
}

#Preview {
    accessibilityElementDemo()
}
