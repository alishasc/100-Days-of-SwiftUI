//
//  ExpenseSection.swift
//  iExpense
//
//  Created by Alisha Carrington on 24/06/2025.
//

import SwiftUI

struct ExpenseSection: View {
    var expenses: Expenses  // from the class
    var expenseType: String
    
    var body: some View {
        List {
            // identify each expense item uniquely by its name
            ForEach(expenseType == "Personal" ? expenses.personalItems : expenses.businessItems) { item in
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
            .onDelete(perform: expenses.removeItems)
        }
    }
}

#Preview {
    ExpenseSection(expenses: Expenses(), expenseType: "Personal")
}

