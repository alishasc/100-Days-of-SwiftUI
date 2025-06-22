//
//  ContentView.swift
//  Edutainment
//
//  Created by Alisha Carrington on 20/06/2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        if viewModel.startGame {
            // play game
            GameView()
        } else {
            // choose game options
            HomeView()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}

