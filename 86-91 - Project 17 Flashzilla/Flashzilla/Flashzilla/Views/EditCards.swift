//
//  EditCards.swift
//  Flashzilla
//
//  Created by Alisha Carrington on 08/09/2025.
//

import SwiftUI

struct EditCards: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var viewModel = ViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                Section("Add new card") {
                    TextField("Prompt", text: $viewModel.newPrompt)
                    TextField("Answer", text: $viewModel.newAnswer)
                    Button("Add Card") {
                        dataManager.addCard(prompt: viewModel.newPrompt, answer: viewModel.newAnswer)
                        viewModel.newPrompt = ""
                        viewModel.newAnswer = ""
                    }
                }
                
                Section {
                    ForEach(0..<dataManager.cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(dataManager.cards[index].prompt)
                                .font(.headline)
                            Text(dataManager.cards[index].answer)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .onDelete(perform: dataManager.removeCards)
                }
            }
            .navigationTitle("Edit Cards")
            .toolbar {
                Button("Done") { dismiss() }
            }
            .onAppear(perform: dataManager.loadData)
        }
    }
}

#Preview {
    EditCards()
}
