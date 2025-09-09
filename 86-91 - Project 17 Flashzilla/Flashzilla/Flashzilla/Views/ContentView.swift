//
//  ContentView.swift
//  Flashzilla
//
//  Created by Alisha Carrington on 01/09/2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var viewModel = ViewModel()
    @Environment(\.accessibilityVoiceOverEnabled) var accessibilityVoiceOverEnabled
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        ZStack {  // background
            Image(decorative: "background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {  // timer above cards
                Text("Time: \(viewModel.timeRemaining)")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                
                ZStack {  // overlapping cards
                    ForEach(0..<viewModel.gameCards.count, id: \.self) { index in
                        CardView(card: viewModel.gameCards[index]) {
                            // below only happens if removal callback is used
                            withAnimation {
                                viewModel.removeCard(at: index)
                            }
                        }
                        .stacked(at: index, in: viewModel.gameCards.count)
                        .allowsHitTesting(index == viewModel.gameCards.count - 1)  // can only swipe the top card
                        .accessibilityHidden(index < viewModel.gameCards.count - 1)  // screen reader can only read top card
                    }
                }
                // can only interact with cards while timer is running
                .allowsHitTesting(viewModel.timeRemaining > 0)
                
                // restart the game when get through all cards
                if viewModel.gameCards.isEmpty {
                    Button("Start Again") {
                        viewModel.startGame(with: dataManager)
                    }
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
                        viewModel.showingEditScreen = true
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
                                viewModel.addWrongCard(at: viewModel.gameCards.count - 1)
                                viewModel.removeCard(at: viewModel.gameCards.count - 1)
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
                                viewModel.removeCard(at: viewModel.gameCards.count - 1)
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
        .sheet(isPresented: $viewModel.showingEditScreen, onDismiss: {
            viewModel.startGame(with: dataManager)
        }, content: EditCards.init)
        .onAppear {
            dataManager.loadData()
            viewModel.startGame(with: dataManager)
        }
        .onReceive(viewModel.timer) { time in
            // exit immediately if app isn't active - stops timer
            guard viewModel.isActive else { return }
            
            // so the timer counts down
            if viewModel.timeRemaining > 0 {
                viewModel.timeRemaining -= 1
            }
        }
        .onChange(of: scenePhase) {
            if scenePhase == .active {
                // if there are still cards, continue the timer
                if viewModel.gameCards.isEmpty == false {
                    viewModel.isActive = true
                }
            } else {
                // app has gone to background
                viewModel.isActive = false
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(DataManager())
}

extension View {
    // takes a position in an array along with the total size of the array
    // each card will be a little further down the screen than the ones before it
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(y: offset * 10)
    }
}
