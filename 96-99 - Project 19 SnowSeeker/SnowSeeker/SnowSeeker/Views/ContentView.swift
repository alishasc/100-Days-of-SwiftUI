//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Alisha Carrington on 16/09/2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: ViewModel
    @State private var favorites = Favorites()
    
    var body: some View {
        NavigationSplitView {
            List(vm.filteredResorts) { resort in
                NavigationLink(value: resort) {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(.rect(cornerRadius: 5))
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            }
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundStyle(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $vm.searchText, prompt: "Search for a resort")
            .navigationDestination(for: Resort.self) { resort in
                ResortView(resort: resort)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    // sorting menu
                    Menu("Sort by") {
                        ForEach(ViewModel.SortByOption.allCases, id: \.self) { option in
                            Button {
                                vm.sortBy = option
                            } label: {
                                if vm.sortBy == option {
                                    Image(systemName: "checkmark")
                                }
                                Text(option.label)
                            }
                        }
                    }
                }
            }
        } detail: {
            WelcomeView()
        }
        // every view presented by the navigation stack can also work withh the Favorites instance
        .environment(favorites)
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}

