//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Alisha Carrington on 03/08/2025.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // so Book model can be used anywhere in app
        .modelContainer(for: Book.self)
    }
}
