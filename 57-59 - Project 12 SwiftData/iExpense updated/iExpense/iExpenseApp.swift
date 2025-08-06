//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Alisha Carrington on 24/06/2025.
//

import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
