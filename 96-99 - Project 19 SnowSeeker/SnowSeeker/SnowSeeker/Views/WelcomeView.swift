//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Alisha Carrington on 18/09/2025.
//

// this will only be shown when the app first launches, then will be replaced by any links the user presses

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker!")
                .font(.largeTitle)
            
            Text("Please select a resort from ther left-hand menu; swipe from the left edge to show it.")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    WelcomeView()
}
