//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Alisha Carrington on 06/08/2025.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            PredicateDemo()
        }
        .modelContainer(for: User.self)
    }
}
