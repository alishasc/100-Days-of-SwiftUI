//
//  AnimateGestures2.swift
//  Animations
//
//  Created by Alisha Carrington on 20/06/2025.
//

import SwiftUI

struct AnimateGestures2: View {
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        HStack(spacing: 0) {
            // loop the length of letters array
            ForEach(0..<letters.count, id: \.self) { num in
                // show each letter of the array
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)  // toggled when drag animation has ended
                    .offset(dragAmount)  // to make the letters move
                    .animation(.linear.delay(Double(num) / 20), value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero  // reset to default position
                    enabled.toggle()  // switch between blue and red
                }
        )
    }
}

#Preview {
    AnimateGestures2()
}
