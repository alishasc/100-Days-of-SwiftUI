//
//  LoadDataDemo.swift
//  CupcakeCorner
//
//  Created by Alisha Carrington on 30/07/2025.
//

import SwiftUI

struct LoadDataDemo: View {
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.self) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        // url we want to read - song list from iTunes
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            // takes URL and returns the Data object at that URL - returns a tuple
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                // assign the array of Results decoded to results var at top
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    LoadDataDemo()
}

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable, Hashable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
