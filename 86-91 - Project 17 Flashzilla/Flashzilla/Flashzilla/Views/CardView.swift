//
//  CardView.swift
//  Flashzilla
//
//  Created by Alisha Carrington on 03/09/2025.
//

import SwiftUI

struct CardView: View {
    @Environment(\.accessibilityVoiceOverEnabled) var accessibilityVoiceOverEnabled
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    let card: Card
    var removal: (() -> Void)? = nil  // callback closure
    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero  // track how far user's dragged
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    accessibilityDifferentiateWithoutColor ? .white : .white
                        .opacity(1 - Double(abs(offset.width / 50)))
                )
                // keep cards white if accessibilityDifferentiateWithoutColor is true
                .background(
                    accessibilityDifferentiateWithoutColor
                        ? nil
                        : RoundedRectangle(cornerRadius: 25)
                            // otherwise card's green when dragged to the right
                            .fill(offset.width > 0 ? .green : .red)
                )
                .shadow(radius: 10)
            
            VStack {
                if accessibilityVoiceOverEnabled {
                    Text(isShowingAnswer ? card.answer : card.prompt)
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                } else {
                    Text(card.prompt)
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                    
                    if isShowingAnswer {
                        Text(card.answer)
                            .font(.title)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(offset.width / 5.0))  // use 1/5th of drag amount so card doesn't spin too fast
        .offset(x: offset.width * 5)  // multiplied so that it works with small gestures
        .opacity(2 - Double(abs(offset.width / 50)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    // move card
                    offset = gesture.translation
                }
                .onEnded { _ in
                    if abs(offset.width) > 100 {
                        // remove the card
                        removal?()
                    } else {
                        // return card to original position
                        offset = .zero
                    }
                }
        )
        .onTapGesture {
            isShowingAnswer.toggle()
        }
        .animation(.bouncy, value: offset)  // so card bounces back to the middle when let go
        .accessibilityAddTraits(.isButton)  // let screen reader know the card's also a button
    }
}

#Preview {
    CardView(card: .example)
}

