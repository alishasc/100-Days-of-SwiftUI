//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Alisha Carrington on 24/06/2025.
//

// represent single item of expense

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
