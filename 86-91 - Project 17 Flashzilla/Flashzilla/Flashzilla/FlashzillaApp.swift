//
//  FlashzillaApp.swift
//  Flashzilla
//
//  Created by Alisha Carrington on 01/09/2025.
//

import SwiftUI

@main
struct FlashzillaApp: App {
    @StateObject private var dataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataManager)
        }
    }
}
