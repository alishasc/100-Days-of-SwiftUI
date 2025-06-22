//
//  Home.swift
//  Edutainment
//
//  Created by Alisha Carrington on 20/06/2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color.cyan.opacity(0.4)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text("Edutainment")
                    .font(.largeTitle).bold()
                
                Spacer()
                
                Text("What times table would you like to practice?")
                    .font(.title3)
                    .fontWeight(.medium)
                Text("\(viewModel.multiplicationNumber)")
                    .font(.title).bold()
                
                Stepper(value: $viewModel.multiplicationNumber, in: 2...12) {
                    Text("")
                }
                .labelsHidden()
                
                Text("Select the number of questions:")
                    .font(.title3)
                    .fontWeight(.medium)
                HStack(spacing: 30) {
                    ForEach(viewModel.numOfQuestions, id: \.self) { num in
                        Button("\(num)") {
                            withAnimation {
                                viewModel.selectedNumOfQuestions = num
                            }
                        }
                        .font(.title).bold()
                        .foregroundStyle(viewModel.selectedNumOfQuestions == num ? .white : .black)
                        .frame(width: 80, height: 80)
                        .background(viewModel.selectedNumOfQuestions == num ? .cyan : .white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        // border
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.blue, lineWidth: 3)
                        )
                    }
                }
                
                Spacer()
                
                // start game
                Button("START") {
                    // transition to new screen with questions
                    viewModel.startGame = true
                }
                .font(.title).bold()
                .foregroundStyle(.blue)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(ViewModel())
}
