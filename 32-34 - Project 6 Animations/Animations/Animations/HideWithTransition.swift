//
//  HideWithTransition.swift
//  Animations
//
//  Created by Alisha Carrington on 20/06/2025.
//

import SwiftUI

struct HideWithTransition: View {
    // hide/show rectangle
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    // separate transitions when hidden/shown - grow when it appears / fade out when disappears
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
                
                    // use custom modifier created in CustomModifier file
                    .transition(.pivot)
            }
        }
    }
}

#Preview {
    HideWithTransition()
}
