//
//  EdutainmentApp.swift
//  Edutainment
//
//  Created by Alisha Carrington on 20/06/2025.
//

import SwiftUI

@main
struct EdutainmentApp: App {
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
