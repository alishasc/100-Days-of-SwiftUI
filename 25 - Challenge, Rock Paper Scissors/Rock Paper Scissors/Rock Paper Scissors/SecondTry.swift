//
//  SecondTry.swift
//  Rock Paper Scissors
//
//  Created by Alisha Carrington on 03/06/2025.
//

import SwiftUI

struct SecondTry: View {
    // rock, paper, scissors playable options
    let options = ["👊🏻", "✋🏻", "✌🏻"]
    let winningMoves = ["✋🏻", "✌🏻", "👊🏻"]
    let losingMoves = ["✌🏻", "👊🏻", "✋🏻"]
    @State private var currentChoice = 0  // app's emoji
    @State private var shouldWin = true
    @State private var score = 0
    @State private var questionCount = 0  // max 10 questions
    @State private var gameOver = false  // for alert
    
    var body: some View {
        VStack(spacing: 70) {
            Text("Score: \(score)")
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(.white)
            Spacer()
            
            // random emoji chosen by app
            Text(options[currentChoice])
                .font(.system(size: 100))
            
            // should player win or lose against the chosen emoji
            Text(shouldWin ? "WIN" : "LOSE")
                .font(.title).bold()
                .foregroundStyle(.white)
            
            // 3 emoji buttons for player to choose from
            HStack {
                ForEach(options, id: \.self) { emoji in
                    Button("\(emoji)") {
                        if shouldWin && winningMoves[currentChoice] == emoji {
                            updateScore(correctChoice: true)
                        } else if !shouldWin && losingMoves[currentChoice] == emoji {
                            updateScore(correctChoice: true)
                        } else {
                            updateScore(correctChoice: false)
                        }
                    }
                }
            }
            .font(.system(size: 100))
            Spacer()
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue.gradient)
        .alert("You're Score: \(score)/10", isPresented: $gameOver) {
            // aren't assigning any functionality to the Button when pressed
            Button("New Game") {
                questionCount = 0
                score = 0
            }
        }
    }
    
    func updateScore(correctChoice: Bool) {
        if correctChoice {
            score += 1
        } else {
            if score > 0 {
                score -= 1
            }
        }
        
        questionCount += 1
        if questionCount < 10 {
            // toggle data for next level
            shouldWin.toggle()
            currentChoice = Int.random(in: 0..<options.count)
        } else {
            gameOver = true
        }
    }
}

#Preview {
    SecondTry()
}
