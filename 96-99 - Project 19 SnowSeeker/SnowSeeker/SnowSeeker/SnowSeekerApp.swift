//
//  SnowSeekerApp.swift
//  SnowSeeker
//
//  Created by Alisha Carrington on 16/09/2025.
//

import SwiftUI

@main
struct SnowSeekerApp: App {
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
