//
//  Game.swift
//  Edutainment
//
//  Created by Alisha Carrington on 20/06/2025.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var viewModel: ViewModel
        
    var body: some View {
        NavigationStack {
            ZStack {
                Color.cyan.opacity(0.4)
                    .ignoresSafeArea()
                
                VStack(spacing: 40) {
                    Text("Level \(viewModel.level) / \(viewModel.selectedNumOfQuestions)")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    // question
                    Text("\(viewModel.multiplicationNumber) x \(viewModel.randomNumber)")
                        .font(.system(size: 60, weight: .bold))
                    
                    // user's answer
                    Text(viewModel.answer.isEmpty ? " " : "\(viewModel.answer)")
                        .font(.system(size: 50, weight: .semibold))
                    
                    // number grid
                    LazyVGrid(columns: viewModel.columns) {
                        ForEach(1...9, id: \.self) { num in
                            Button("\(num)") {
                                viewModel.answer += "\(num)"
                            }
                        }
                        Text("")
                        Button("0") {
                            viewModel.answer += "0"
                        }
                        Button("", systemImage: "delete.backward.fill") {
                            if viewModel.answer.count > 0 {
                                viewModel.answer.removeLast()
                            }
                        }
                        .accessibilityLabel(Text("Backspace"))
                    }
                    .padding([.top, .bottom], 30)
                    .background(Color.white.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .font(.largeTitle)
                    
                    Spacer()
                    
                    Button("NEXT") {
                        // function to go to next level
                        viewModel.nextLevel()
                    }
                    .font(.title).bold()
                    .foregroundStyle(.blue)
                    
                    Spacer()
                }
                .padding()
            }
            // when press Home button on toolbar
            .alert("Are you sure you want to finish practicing?", isPresented: $viewModel.showQuitAlert) {
                Button("Continue", role: .cancel) { }
                Button("Quit", role: .destructive) {
                    viewModel.startGame = false
                    viewModel.resetGame()
                }
            }
            // end of game popup
            .overlay {
                VStack(spacing: 50) {
                    Text("Completed all levels! 🎉")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("\(viewModel.score)/\(viewModel.selectedNumOfQuestions)")
                        .font(.largeTitle).bold()
                    
                    // buttons
                    HStack(spacing: 60) {
                        // restart
                        Button("Restart") {
                            // function to restart game with same options
                            viewModel.resetGame()
                        }
                        
                        // go back to home screen
                        Button("Home") {
                            // show options screen
                            viewModel.startGame = false
                            viewModel.resetGame()
                        }
                    }
                    .font(.title3).bold()
                }
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 300, height: 300)
                        .foregroundStyle(.cyan)
                }
                .opacity(viewModel.completedLevels ? 1 : 0)
                .foregroundStyle(.white)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Home") {
                        // trigger alert to confirm
                        viewModel.showQuitAlert = true
                    }
                }
            }
        }
    }
}

#Preview {
    GameView()
        .environmentObject(ViewModel())
}
