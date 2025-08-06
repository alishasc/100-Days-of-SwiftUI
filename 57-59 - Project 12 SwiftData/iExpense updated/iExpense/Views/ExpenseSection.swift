//
//  ExpenseSection.swift
//  iExpense
//
//  Created by Alisha Carrington on 24/06/2025.
//

import SwiftData
import SwiftUI

struct ExpenseSection: View {
    @Query var expenseItems: [ExpenseItem]
    var expenses: Expenses  // from the class
    
    init(expenses: Expenses, expenseType: String, sortOrder: [SortDescriptor<ExpenseItem>]) {
        self.expenses = expenses
        _expenseItems = Query(filter: #Predicate<ExpenseItem> { item in
            item.type == expenseType
        }, sort: sortOrder)
    }
    
    var body: some View {
        ForEach(expenseItems) { item in
            HStack {
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text(item.type)
                }
                
                Spacer()
                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "GBP"))
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(expenses.backgroundColor(amount: item.amount).opacity(0.1))
            )
        }
    }
}

#Preview {
    ExpenseSection(expenses: Expenses(), expenseType: "Personal", sortOrder: [SortDescriptor(\ExpenseItem.name)])
        .modelContainer(for: ExpenseItem.self)
}

