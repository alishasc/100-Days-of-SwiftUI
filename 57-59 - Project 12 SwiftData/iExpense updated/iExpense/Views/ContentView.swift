//
//  ContentView.swift
//  iExpense
//
//  Created by Alisha Carrington on 24/06/2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    // default sorting - alphabetically
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name)
    ]
    @State private var sortingByName = true
    
    @State private var expenses = Expenses() // instance of the CLASS
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Personal Expenses") {
                    ExpenseSection(expenses: expenses, expenseType: "Personal", sortOrder: sortOrder)
                }
                
                Section("Business Expenses") {
                    ExpenseSection(expenses: expenses, expenseType: "Business", sortOrder: sortOrder)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Expense", systemImage: "plus") {
                        showingAddExpense = true
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Sort by name")
                                .tag([
                                    SortDescriptor(\ExpenseItem.name)
                                ])
                            
                            Text("Sort by amount")
                                .tag([
                                    SortDescriptor(\ExpenseItem.amount)
                                ])
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
}

#Preview {
    ContentView()
}

