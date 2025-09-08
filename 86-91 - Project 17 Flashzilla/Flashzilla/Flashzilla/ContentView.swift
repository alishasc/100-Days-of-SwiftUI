//
//  ContentView.swift
//  Flashzilla
//
//  Created by Alisha Carrington on 01/09/2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = true  // change to false when player has finished all cards
    @State private var cards = Array<Card>(repeating: .example, count: 10)
    @State private var timeRemaining = 100  // 100 seconds
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {  // background
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {  // timer above cards
                Text("Time: \(timeRemaining)")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                
                ZStack {  // overlapping cards
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: cards[index]) {
                           withAnimation {
                               removeCard(at: index)
                           }
                        }
                        .stacked(at: index, in: cards.count)
                    }
                }
                // can only interact with cards while timer is running
                .allowsHitTesting(timeRemaining > 0)
                
                // restart the game when get through all cards
                if cards.isEmpty {
                    Button("Start Again", action: resetCards)
                        .padding()
                        .background(.white)
                        .foregroundStyle(.black)
                        .clipShape(.capsule)
                }
            }
            
            // show extra icons if user's colorblind
            if accessibilityDifferentiateWithoutColor {
                VStack {
                    Spacer()
                    
                    HStack {
                        Image(systemName: "xmark.circle")
                            .padding()
                            .background(.black.opacity(0.7))
                            .clipShape(.circle)
                        Spacer()
                        Image(systemName: "checkmark.circle")
                            .padding()
                            .background(.black.opacity(0.7))
                            .clipShape(.circle)
                    }
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding()
                }
            }
        }
        .onReceive(timer) { time in
            // exit immediately if app isn't active - stops timer
            guard isActive else { return }
            
            // so the timer counts down
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .onChange(of: scenePhase) {
            if scenePhase == .active {
                // if there are still cards, continue the timer
                if cards.isEmpty == false {
                    isActive = true
                }
            } else {
                // app has gone to background
                isActive = false
            }
        }
    }
    
    func removeCard(at index: Int) {
        cards.remove(at: index)
        
        if cards.isEmpty {
            isActive = false  // stop timer - end of game
        }
    }
    
    func resetCards() {
        cards = Array<Card>(repeating: .example, count: 10)
        timeRemaining = 100
        isActive = true
    }
}

#Preview {
    ContentView()
}

extension View {
    // takes a position in an array along with the total size of the array
    // each card will be a little further down the screen than the ones before it
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(y: offset * 10)
    }
}
