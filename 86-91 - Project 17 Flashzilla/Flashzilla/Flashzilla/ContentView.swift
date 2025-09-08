//
//  ContentView.swift
//  Flashzilla
//
//  Created by Alisha Carrington on 01/09/2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.accessibilityVoiceOverEnabled) var accessibilityVoiceOverEnabled
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = true  // change to false when player has finished all cards
    @State private var showingEditScreen = false
    @State private var cards = [Card]()  // gets filled at runtime
    @State private var timeRemaining = 100  // 100 seconds
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {  // background
            Image(decorative: "background")
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
                        .allowsHitTesting(index == cards.count - 1)  // can only swipe the top card
                        .accessibilityHidden(index < cards.count - 1)  // screen reader can only read top card
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
            
            VStack {  // button to add a new card
                HStack {
                    Spacer()
                    
                    Button {
                        showingEditScreen = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .padding()
                            .background(.black.opacity(0.7))
                            .clipShape(.circle)
                    }
                }
                
                Spacer()
            }
            .foregroundStyle(.white)
            .font(.largeTitle)
            .padding()
            
            // show extra icons if user's colorblind
            if accessibilityDifferentiateWithoutColor || accessibilityVoiceOverEnabled {
                VStack {
                    Spacer()
                    
                    HStack {
                        Button {
                            withAnimation {
                                removeCard(at: cards.count - 1)
                            }
                        } label: {
                            Image(systemName: "xmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(.circle)
                        }
                        .accessibilityLabel("Wrong")
                        .accessibilityHint("Mark your answer as being incorrect.")
                        
                        Spacer()
                        
                        Button {
                            withAnimation {
                                removeCard(at: cards.count - 1)
                            }
                        } label: {
                            Image(systemName: "checkmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(.circle)
                        }
                        .accessibilityLabel("Correct")
                        .accessibilityHint("Mark your answer as being correct.")
                    }
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding()
                }
            }
        }
        .sheet(isPresented: $showingEditScreen, onDismiss: resetCards, content: EditCards.init)
        .onAppear(perform: resetCards)
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
        // check the card exists first - for when using the buttons to remove cards
        guard index >= 0 else { return }
        
        cards.remove(at: index)
        
        if cards.isEmpty {
            isActive = false  // stop timer - end of game
        }
    }
    
    func resetCards() {
        timeRemaining = 100
        isActive = true
        loadData()
    }
    
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
            }
        }
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
