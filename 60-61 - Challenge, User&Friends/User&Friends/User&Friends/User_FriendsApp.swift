//
//  User_FriendsApp.swift
//  User&Friends
//
//  Created by Alisha Carrington on 09/08/2025.
//

import SwiftData
import SwiftUI

@main
struct User_FriendsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
