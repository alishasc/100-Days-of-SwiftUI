//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Alisha Carrington on 16/09/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var vm = ViewModel()
    
    var body: some View {
        NavigationSplitView {
            List(vm.resorts) { resort in
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
                    }
                }
            }
            .navigationTitle("Resorts")
            .navigationDestination(for: Resort.self) { resort in
                ResortView(resort: resort)
            }
        } detail: {
            WelcomeView()
        }
    }
}

#Preview {
    ContentView()
}

