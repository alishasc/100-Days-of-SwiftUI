//
//  EditLocationView.swift
//  BucketList
//
//  Created by Alisha Carrington on 15/08/2025.
//

// sheet shown when holding a location marker - edit saved location details

import SwiftUI

enum LoadingState {
    case loading, loaded, failed
}

struct EditLocationView: View {
    @State private var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    // function that accepts a single Location and returns nothing
    var onSave: (Location) -> Void
    
    var onDelete: (Location) -> Void

    init(location: Location, onSave: @escaping (Location) -> Void, onDelete: @escaping (Location) -> Void) {
        self.onSave = onSave
        self.onDelete = onDelete
        
        // so the @State properties come from the Location being passed in - so the user sees the saved data
        _viewModel = State(initialValue: ViewModel(location: location))
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Place name", text: $viewModel.name)
                    TextField("Description", text: $viewModel.description)
                }
                
                Section("Nearby...") {
                    switch viewModel.loadingState {
                    case .loaded:
                        ForEach(viewModel.pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ")
                            + Text(page.description)
                                .italic()
                        }
                    case .loading:
                        Text("Loading...")
                    case .failed:
                        Text("Please try again later.")
                    }
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        // send the new location back with onSave()
                        onSave(viewModel.saveNewDetails())
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Delete", role: .destructive) {
                        // remove the Location from the array
                        onDelete(viewModel.location)
                        
                        dismiss()
                    }
                    .tint(.red)
                }
            }
            .task {
                // try and fetch nearby places as soon as the view appears
                await viewModel.fetchNearbyPlaces()
            }
        }
    }
}

#Preview {
    EditLocationView(
        location: .example,
        onSave: { _ in },
        onDelete: { _ in }
    )
}
