//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Alisha Carrington on 21/08/2025.
//

import SwiftData
import SwiftUI

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
