//
//  ContentView-ViewModel.swift
//  Flashzilla
//
//  Created by Alisha Carrington on 09/09/2025.
//

import Foundation

extension ContentView {
    @Observable
    class ViewModel {
        var isActive = false  // change to false when player has finished all cards
        var showingEditScreen = false
        var gameCards = [Card]()  // copy of cards
        var timeRemaining = 100  // 100 seconds
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        
        func removeCard(at index: Int) {
            // check the card exists first - for when using the buttons to remove cards
            guard index >= 0 else { return }
            
            gameCards.remove(at: index)
            
            if gameCards.isEmpty {
                isActive = false  // stop timer - end of game
            }
        }
        
        func addWrongCard(at index: Int) {
            guard index >= 0 else { return }
            
            // add current card to start of the array so appears again
            gameCards.insert(gameCards[index], at: 0)
        }
        
        func startGame(with dataManager: DataManager) {
            gameCards = dataManager.cards
            isActive = true
            timeRemaining = 100
        }
    }
}
