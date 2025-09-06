//
//  ContentView.swift
//  Flashzilla
//
//  Created by Alisha Carrington on 01/09/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var cards = Array<Card>(repeating: .example, count: 10)
    
    var body: some View {
        ZStack {  // background
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {  // place timer above cards
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
            }
        }
    }
    
    func removeCard(at index: Int) {
        cards.remove(at: index)
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
