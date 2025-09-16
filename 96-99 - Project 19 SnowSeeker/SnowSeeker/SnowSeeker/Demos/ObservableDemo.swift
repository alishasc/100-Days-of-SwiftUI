//
//  ObservableDemo.swift
//  SnowSeeker
//
//  Created by Alisha Carrington on 16/09/2025.
//

import SwiftUI

struct ObservableDemo: View {
    @State private var player = Player()
    
    var body: some View {
        VStack {
            Text("Welcome!")
            HighScoreView()
        }
        .environment(player)
    }
}

struct HighScoreView: View {
    @Environment(Player.self) var player
    
    var body: some View {
//        Text("Your high score: \(player.highScore)")
        
        @Bindable var player = player  // for the Stepper to work
        Stepper("High score: \(player.highScore)", value: $player.highScore)
    }
}

@Observable
class Player {
    var name = "Anonymous"
    var highScore = 0
}

#Preview {
    ObservableDemo()
}
