//
//  ContentView.swift
//  iExpense
//
//  Created by Alisha Carrington on 24/06/2025.
//

import SwiftUI

struct ContentView: View {
    // instance of the CLASS
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Personal Expenses") {
                    ExpenseSection(expenses: expenses, expenseType: "Personal")
                }
                
                Section("Business Expenses") {
                    ExpenseSection(expenses: expenses, expenseType: "Business")
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
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

