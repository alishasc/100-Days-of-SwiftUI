//
//  ViewModel.swift
//  Edutainment
//
//  Created by Alisha Carrington on 20/06/2025.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var startGame = false

    // home screen
    @Published var multiplicationNumber = 2
    @Published var numOfQuestions = [5, 10, 20]
    @Published var selectedNumOfQuestions = 5
    
    // gameplay
    let columns = [
        GridItem(.adaptive(minimum: 100, maximum: 100)),
        GridItem(.adaptive(minimum: 100, maximum: 100)),
        GridItem(.adaptive(minimum: 100, maximum: 100)),
    ]
    
    @Published var randomNumber = Int.random(in: 1...12)
    @Published var answer = ""
    @Published var level = 1
    @Published var score = 0
    @Published var completedLevels = false  // trigger final score overlay
    @Published var showQuitAlert = false  // trigger alert when press Home button
    
    func nextLevel() {
        // check if answer isn't empty - do nothing if empty
        if !answer.isEmpty {
            // check if answer's correct
            if Int(answer) == (multiplicationNumber * randomNumber) {
                score += 1
            }
            
            // check if completed all levels
            if level < selectedNumOfQuestions {
                level += 1
                
                // reset textfield
                answer = ""
                
                // generate new number to multiply by
                randomNumber = Int.random(in: 1...12)
            } else {
                // end game and show final score overlay
                completedLevels = true
            }
        }
    }
    
    func resetGame() {
        // reset all vars and generate new random number
        answer = ""
        level = 1
        score = 0
        randomNumber = Int.random(in: 1...12)
        completedLevels = false  // hide score popup
    }
}
