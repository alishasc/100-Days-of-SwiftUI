//
//  AnimateGestures.swift
//  Animations
//
//  Created by Alisha Carrington on 20/06/2025.
//

import SwiftUI

struct AnimateGestures: View {
    @State private var dragAmount = CGSize.zero  // amount of drag
    
    var body: some View {
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius: 10))
            .offset(dragAmount)  // CGSize value
            .gesture(
                DragGesture()
                    // translation of drag = how far it's moved from start point
                    .onChanged { dragAmount = $0.translation }
                    // reset dragAmount to zero
//                    .onEnded { _ in dragAmount = .zero }
                
                    // explicit animation below - only animates the release
                    .onEnded { _ in
                        withAnimation(.bouncy) {
                            dragAmount = .zero
                        }
                    }
            )
            // implicit animation - animate both drag and release
//            .animation(.bouncy, value: dragAmount)
        
        
        
    }
}

#Preview {
    AnimateGestures()
}
