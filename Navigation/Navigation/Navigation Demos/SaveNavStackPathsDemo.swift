//
//  SaveNavStackPathsDemo.swift
//  Navigation
//
//  Created by Alisha Carrington on 01/07/2025.
//

// using Codable to save path as [Int]

import SwiftUI
import Foundation

@Observable
class PathStore {
    var path: [Int] {
        // didSet - execute code when a property has just been set
        didSet {
            save()
        }
    }
    
    // where the data is being saved
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    // load saved data when class is initialised
    init() {
        // if the data exists...
        if let data = try? Data(contentsOf: savePath) {
            // decode it and set it as the current path
            if let decoded = try? JSONDecoder().decode([Int].self, from: data) {
                path = decoded
                return
            }
        }
        
        // if no path is saved start with from an empty array
        path = []
    }
    
    // runs everytime the path changes
    func save() {
        do {
            let data = try JSONEncoder().encode(path)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

struct SaveNavStackPathsDemo: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SaveNavStackPathsDemo()
}
