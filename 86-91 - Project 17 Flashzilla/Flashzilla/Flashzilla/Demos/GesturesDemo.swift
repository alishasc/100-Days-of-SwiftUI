//
//  GesturesDemo.swift
//  Flashzilla
//
//  Created by Alisha Carrington on 02/09/2025.
//

import SwiftUI

struct GesturesDemo: View {
    var body: some View {
        Text("Hello, World!")
            .onTapGesture(count: 2) {
                print("Double tapped!")
            }
        
        Text("Hello!")
            .onLongPressGesture(minimumDuration: 1) {
                // prints after the minimumDuration
                print("Long pressed!")
            } onPressingChanged: { inProgress in
                // true when have started long press gesture
                // false when have ended it
                print("In progress: \(inProgress)")
            }
    }
}

// scale a view up and down - pinch-to-zoom
struct MagnifyDemo: View {
    @State private var currentAmount = 0.0  // the temporary scale change
    @State private var finalAmount = 1.0  // the cumulative scale change. starts at 1.0 - normal size
    
    var body: some View {
        Text("Hello, World!")
            .scaleEffect(finalAmount + currentAmount)  // the Text is multipled by this value
            .gesture(
                MagnifyGesture()
                    // action to do when gesture is happening
                    .onChanged { value in
                        // subtract 1 as 1 is the default value for a new gesture
                        currentAmount = value.magnification - 1
                    }
                    // action to do when gesture has ended
                    .onEnded { value in
                        // save current state of the scaled view. need this or the size will snap back to original size
                        finalAmount += currentAmount
                        currentAmount = 0  // adds smoothness between gestures
                    }
            )
    }
}

struct RotationDemo: View {
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero
    
    var body: some View {
        Text("Hello, World!")
            .font(.title)
            .rotationEffect(currentAmount + finalAmount)
            .gesture(
                RotateGesture()
                    .onChanged { value in
                        currentAmount = value.rotation
                    }
                    .onEnded { value in
                        finalAmount += value.rotation
                        currentAmount = .zero
                    }
            )
    }
}

struct GestureClashDemo: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .onTapGesture {
                    print("Text tapped")
                }
        }
        // force the parent's gesture to trigger
//        .highPriorityGesture(
//            TapGesture()
//                .onEnded {
//                    print("VStack tapped")
//                }
//        )
        
        // if you want both the parent and child gestures to trigger at the same time
        .simultaneousGesture(
            TapGesture()
                .onEnded {
                    print("VStack tapped")
                }
        )
    }
}

// by combining gestures, you have to long press the circle before you can drag it
struct GestureSequenceDemo: View {
    // how far the circle has been dragged
    @State private var offset = CGSize.zero
    // whether the circle is currently being dragged
    @State private var isDragging = false
    
    var body: some View {
        // drag gesture that updates offset and isDragging as circle moves around
        let dragGesture = DragGesture()
            // to move the circle around the screen
            .onChanged { value in offset = value.translation }
            .onEnded { _ in
                withAnimation {
                    offset = .zero  // circle goes back to center
                    isDragging = false  // size scales down to original
                }
            }
        
        // long press gesture that enables isDragging
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true  // triggers circle to scale up
                }
            }
        
        // combined gesture that forces the user to long press then drag
        let combined = pressGesture.sequenced(before: dragGesture)
        
        // circle scales up when it's dragged,
        // sets its offset to whatever we get back from the drag gesture
        // and uses the combined gesture
        Circle()
            .fill(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined)
    }
}

#Preview {
    GestureSequenceDemo()
}

