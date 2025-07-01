//
//  SaveNavStackPathsDemo2.swift
//  Navigation
//
//  Created by Alisha Carrington on 01/07/2025.
//

// using Codable to save path as NavigationPath

import SwiftUI
import Foundation

@Observable
class PathStore2 {
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
        
        // if decoding fails, assign a new empty NavigationPath
        path = NavigationPath()
    }
    
    func save() {
        // attempts to retrieve the Codable navigation path
        guard let representation = path.codable else { return }
        
        do {
            // convert the Codable representation to JSON
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

struct SaveNavStackPathsDemo2: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SaveNavStackPathsDemo2()
}
