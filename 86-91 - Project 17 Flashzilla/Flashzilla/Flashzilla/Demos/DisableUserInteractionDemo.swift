//
//  DisableUserInteractionDemo.swift
//  Flashzilla
//
//  Created by Alisha Carrington on 02/09/2025.
//

import SwiftUI

struct DisableUserInteractionDemo: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle Tapped!")
                }
            
            Circle()
                .fill(.red)
                .frame(width: 300, height: 300)
                .contentShape(.rect)  // can't tap the rect behind - covered by this content shape
                .onTapGesture {
                    print("Circle tapped!")
                }
//                .allowsHitTesting(false)  // can't tap the circle
        }
    }
}

struct ContentShapeStack: View {
    var body: some View {
        VStack {
            Text("Hello")
            Spacer().frame(height: 100)
            Text("World")
        }
        .contentShape(.rect)  // can now tap the empty space in middle
        .onTapGesture {
            print("VStack tapped!")
        }
    }
}

#Preview {
    DisableUserInteractionDemo()
}

#Preview {
    ContentShapeStack()
}
